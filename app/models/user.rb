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

  has_many :friendships_a, class_name: 'Friendship', inverse_of: :friend_a, dependent: :destroy,
                           foreign_key: :friend_a_id
  has_many :friendships_b, class_name: 'Friendship', inverse_of: :friend_b, dependent: :destroy,
                           foreign_key: :friend_b_id

  has_one :payment_account, dependent: :destroy
  has_one :external_payment_source, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, presence: true

  delegate :balance, to: :payment_account, prefix: true
end
