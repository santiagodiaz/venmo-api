require 'rails_helper'

describe FeedService, type: :service do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:user_c) { create(:user) }
  let!(:user_d) { create(:user) }
  let!(:friendship1) do
    create(:friendship, friend_a: user_a, friend_b: user_b)
  end
  let!(:friendship2) do
    create(:friendship, friend_a: user_b, friend_b: user_c)
  end
  let!(:friendship3) do
    create(:friendship, friend_a: user_c, friend_b: user_d)
  end

end
