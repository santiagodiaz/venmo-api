require 'rails_helper'

describe FeedService, type: :service do
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
  let!(:friendship4) do
    create(:friendship, friend_a: user_d, friend_b: user_e)
  end

  let!(:payment1) do
    create(:payment, sender: user_a, recipient: user_b)
  end
  let!(:payment2) do
    create(:payment, sender: user_b, recipient: user_c)
  end
  let!(:payment3) do
    create(:payment, sender: user_d, recipient: user_e)
  end

  subject(:feed_activities) do
    FeedService.new(user_a, page_number).feed_activities
  end

  describe 'when the page is 1 and there are 3 items' do
    let(:page_number) { 1 }

    it 'returns the items of the first page of the feed, at most 10 items' do
      expected_payments = [payment1, payment2]
      result = subject
      expect(result[0]).to eq(1)
      expect(result[1]).to contain_exactly(*expected_payments)
    end
  end

  describe 'when the page is 2 and there are 3 items' do
    let(:page_number) { 2 }

    it 'returns empty list, as the first page contains up to 10 items' do
      result = subject
      expect(result[0]).to eq(1)
      expect(result[1]).to contain_exactly
    end
  end
end
