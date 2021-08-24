describe MoneyTransferService do
  let!(:user) { create(:user) }
  let!(:payment_account) { create(:payment_account, user: user, balance: 100) }
  let!(:external_payment_source) { create(:external_payment_source, user: user) }

  subject do
    MoneyTransferService.new(external_payment_source,
                             user.payment_account).transfer(amount - user.payment_account_balance)
  end

  describe 'when the balance is not enough for the amount' do
    let(:amount) { 300 }

    it 'uses the money from the sender\'s external payment source' do
      expect { subject }.to change { user.payment_account.reload.balance }.from(100).to(300)
    end
  end
end
