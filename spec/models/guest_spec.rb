require 'rails_helper'

describe Guest, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :party}
  end
  describe "model methods" do
    it 'rsvp_yes' do
      user = create :user
      friend = create :user

      user.add_friend(friend)

      party = Party.new(title: 'hi', runtime: '10 min', datetime_of_party: DateTime.current, user_id: user.id)
      guest = Guest.new(party_id: party.id, user_id: friend.id)

      guest.rsvp_yes

      expect(guest.status).to eq("I'm in!")
    end
    it 'rsvp_no' do
      user = create :user
      friend = create :user

      user.add_friend(friend)

      party = Party.new(title: 'hi', runtime: '10 min', datetime_of_party: DateTime.current, user_id: user.id)
      guest = Guest.new(party_id: party.id, user_id: friend.id)

      guest.rsvp_no

      expect(guest.status).to eq("Hard Pass")
    end
  end
end
