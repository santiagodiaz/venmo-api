# == Schema Information
#
# Table name: payments
#
#  id           :bigint           not null, primary key
#  amount       :float
#  description  :text
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_payments_on_recipient_id  (recipient_id)
#  index_payments_on_sender_id     (sender_id)
#
require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject { build :payment }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than(0).is_less_than(1_000) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:sender).class_name('User') }
    it { is_expected.to belong_to(:recipient).class_name('User') }
  end
end
