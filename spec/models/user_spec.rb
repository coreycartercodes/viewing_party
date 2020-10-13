require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end
  describe "relationships" do
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
  end
  describe "model methods" do
    it 'add_friend' do
      user = create :user
      friend = create :user
      user.add_friend(friend)

      expect(user.friends.size).to eq(1)
    end
  end
end
