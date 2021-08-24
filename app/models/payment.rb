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
class Payment < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  delegate :username, to: :sender, prefix: true
  delegate :username, to: :recipient, prefix: true

  validates :amount, presence: true
end
