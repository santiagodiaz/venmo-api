class PaymentService
  attr_reader :recipient, :sender, :amount, :description

  def initialize(user, params)
    @recipient = User.find_by(id: params[:friend_id])
    @sender = user
    @amount = params[:amount]
    @description = params[:description]
  end

  def pay_to_friend
    validates_amount_positive
    validates_friendship
    use_external_payment_account unless balance_enough?
    start_transaction
  end

  private

  def validates_amount_positive
    raise NegativeOrZeroAmountError if amount <= 0
  end

  def validates_friendship
    raise NotFriendsError unless FriendshipService.new(sender).friend_of?(recipient)
  end

  def balance_enough?
    sender.payment_account_balance >= amount
  end

  def use_external_payment_account
    MoneyTransferService.new(sender.external_payment_source, sender.payment_account)
                        .transfer(amount)
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