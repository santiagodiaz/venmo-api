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

  validate :friendship_uniqueness, on: %i[create update]

  def self.exists_friendship(user, friend)
    where(friend_a: user, friend_b: friend)
      .or(Friendship.where(friend_a: friend, friend_b: user)).exists?
  end

  private

  def friendship_uniqueness
    return unless Friendship.exists_friendship(friend_a, friend_b)

    errors.add(:friendship, I18n.t('api.errors.friendship_exists'))
  end
end
