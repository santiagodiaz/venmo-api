require 'rails_helper'

describe PaymentService, type: :service do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:friendship) do
    create(:friendship, friend_a: user_a, friend_b: user_b)
  end
  let!(:external_payment_source) { create(:external_payment_source, user: user_a) }
  let!(:external_payment_source) { create(:external_payment_source, user: user_b) }
  let!(:payment_account_a) { create(:payment_account, user: user_a, balance: 100) }
  let!(:payment_account_b) { create(:payment_account, user: user_b, balance: 15) }
  let!(:params) { { friend_id: user_b.id, amount: amount, description: description } }

  subject do
    PaymentService.new(user_a, params).pay_to_friend
  end

  describe 'when the parameters are valid' do
    describe 'when the balance is enough for the amount' do
      let(:description) { 'Pizzas' }
      let(:amount) { 5 }

      it 'decreases the money from the sender\'s payment account' do
        expect { subject }.to change {
          user_a.payment_account.reload.balance
        }.from(100).to(95)
      end

      it 'increases the money from the recipient\'s payment account' do
        expect { subject }.to change {
          user_b.payment_account.reload.balance
        }.from(15).to(20)
      end
    end

    describe 'when the balance is not enough for the amount' do
      let(:description) { 'Pizzas' }
      let(:amount) { 110 }

      it 'uses the money from the sender\'s external payment source' do
        expect_any_instance_of(MoneyTransferService).to receive(:transfer).with(10)
        subject
      end

      it 'increases the money from the recipient\'s payment account' do
        expect { subject }.to change {
          user_b.payment_account.reload.balance
        }.from(15).to(125)
      end
    end
  end

  describe 'when the parameters are not valid' do
    describe 'when the amount is a negative value' do
      let(:description) { 'Pizza' }
      let(:amount) { -110 }

      it 'raises a negative amount error' do
        expect { subject }.to raise_error(NegativeOrZeroAmountError)
      end
    end

    describe 'when the amount is more or equal than 1000' do
      let(:description) { 'Pizza' }
      let(:amount) { 1000 }

      it 'raises a negative amount error' do
        expect { subject }.to raise_error(MoreThanLimitAmountError)
      end
    end

    describe 'when the user is not a friend' do
      let(:amount) { 100 }
      let(:params) { { friend_id: create(:user).id, amount: amount } }

      it 'raises a not users friendship error' do
        expect { subject }.to raise_error(NotFriendsError)
      end
    end
  end
end
