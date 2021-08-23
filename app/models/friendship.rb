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
class Friendship < ApplicationRecord
  belongs_to :friend_a, class_name: 'User'
  belongs_to :friend_b, class_name: 'User'
end
