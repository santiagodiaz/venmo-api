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
  subject { build :friendship }

  describe 'associations' do
    it { is_expected.to belong_to(:friend_a).class_name('User') }
    it { is_expected.to belong_to(:friend_b).class_name('User') }
  end

  describe 'validations' do
    context '.friendship_uniqueness' do
      let!(:user_a) { create(:user) }
      let!(:user_b) { create(:user) }
      let!(:friendship) do
        create(:friendship, friend_a: user_a, friend_b: user_b)
      end

      subject { build(:friendship, friend_a: user_b, friend_b: user_a) }

      it 'returns an error message' do
        subject.valid?
        expect(subject.errors[:friendship]).to include(
                                                 I18n.t('api.errors.friendship_exists')
                                               )
      end
    end
  end
end
