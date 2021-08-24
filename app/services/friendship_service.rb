class FriendshipService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friend_of?(user_b)
    Friendship.where(friend_a_id: @user.id, friend_b_id: user_b.id)
              .or(Friendship.where(friend_a_id: user_b.id, friend_b_id: @user.id))
              .exists?
  end
end
