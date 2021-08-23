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
FactoryBot.define do
  factory :payment do
    amount { 1.5 }
    description { "MyText" }
    recipient { nil }
    sender { nil }
  end
end
