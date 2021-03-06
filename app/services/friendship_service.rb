class FriendshipService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friend_of?(user_b_id)
    user_a_id = @user.id
    Friendship.where(friend_a_id: user_a_id, friend_b_id: user_b_id)
              .or(Friendship.where(friend_a_id: user_b_id, friend_b_id: user_a_id))
              .exists?
  end

  def find_friends_second_degree
    friends_ids = find_friends_ids(user.id)
    friends_of_friends = find_friends_ids(friends_ids)
    (friends_ids + friends_of_friends).uniq
  end

  private

  def find_friends_ids(ids)
    Friendship.where(friend_a_id: ids)
              .or(Friendship.where(friend_b_id: ids)).pluck(
                :friend_a_id, :friend_b_id
              ).flatten.uniq
  end
end
