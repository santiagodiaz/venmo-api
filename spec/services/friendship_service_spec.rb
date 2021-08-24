require 'rails_helper'

describe FriendshipService, type: :service do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:user_c) { create(:user) }
  let!(:user_d) { create(:user) }
  let!(:user_e) { create(:user) }
  let!(:friendship1) do
    create(:friendship, friend_a: user_a, friend_b: user_b)
  end
  let!(:friendship2) do
    create(:friendship, friend_a: user_b, friend_b: user_c)
  end
  let!(:friendship3) do
    create(:friendship, friend_a: user_c, friend_b: user_d)
  end

  subject(:friend_of) do
    FriendshipService.new(user_a).friend_of?(user_b.id)
  end

  subject(:not_friend_of) do
    FriendshipService.new(user_a).friend_of?(user_c.id)
  end

  subject(:friends_second_degree) do
    FriendshipService.new(user_a).find_friends_second_degree
  end

  subject(:empty_friends) do
    FriendshipService.new(user_e).find_friends_second_degree
  end

  describe 'when the user is friend of another' do
    it 'returns true' do
      expect(friend_of).to be(true)
    end

    it 'retrieves friends ids up to second degree' do
      expect(friends_second_degree).to match_array([user_a.id, user_b.id, user_c.id])
    end
  end

  describe 'when the user is not friend of another' do
    it 'returns false' do
      expect(not_friend_of).to be(false)
    end

    it 'retrieves empty friends ids' do
      expect(empty_friends).to match_array([])
    end
  end
end
