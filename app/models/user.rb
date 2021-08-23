# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_many :sent_payments, class_name: 'Payment', inverse_of: :sender, dependent: :destroy,
                           foreign_key: :sender_id
  has_many :received_payments, class_name: 'Payment', inverse_of: :receiver, dependent: :destroy,
                               foreign_key: :recipient_id

  has_one :payment_account, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, presence: true
end
