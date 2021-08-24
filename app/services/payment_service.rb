class PaymentService
  attr_reader :recipient, :sender, :amount, :description

  def initialize(user, params)
    @recipient = User.find_by(id: params[:friend_id])
    @sender = user
    @amount = params[:amount]
    @description = params[:description]
  end

  def pay_to_friend
    validates_amount_limit
    validates_friendship
    use_external_payment_account unless balance_enough?
    start_transaction
  end

  private

  def validates_amount_limit
    raise NegativeOrZeroAmountError if amount <= 0
    raise MoreThanLimitAmountError if amount >= 1000
  end

  def validates_friendship
    raise NotFriendsError unless FriendshipService.new(sender).friend_of?(recipient.id)
  end

  def balance_enough?
    sender.payment_account_balance >= amount
  end

  def use_external_payment_account
    MoneyTransferService.new(sender.external_payment_source, sender.payment_account)
                        .transfer(amount - sender.payment_account_balance)
  end

  def start_transaction
    ActiveRecord::Base.transaction do
      sender.payment_account.add_to_balance(-amount)
      recipient.payment_account.add_to_balance(amount)
      create_payment
    end
  end

  def create_payment
    Payment.create!(
      recipient: recipient,
      sender: sender,
      amount: amount,
      description: description
    )
  end
end
