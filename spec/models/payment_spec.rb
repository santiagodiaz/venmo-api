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
  pending "add some examples to (or delete) #{__FILE__}"
end
