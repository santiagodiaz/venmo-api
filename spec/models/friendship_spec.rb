# == Schema Information
#
# Table name: friendships
#
#  id          :bigint           not null, primary key
#  friend_a_id :bigint           not null
#  friend_b_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_friendships_on_friend_a_id  (friend_a_id)
#  index_friendships_on_friend_b_id  (friend_b_id)
#
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
