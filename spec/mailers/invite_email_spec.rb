require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'invite' do
    before :each do
    @sending_user = create :user
    @friend1 = create :user
    @friend2 = create :user
    @party = @sending_user.parties.create({
      title: 'Alice in Wonderland',
      api_id: 5,
      runtime: '101 Minutes',
      datetime_of_party: 'Wed, 14 Oct 2020 22:52:02 UTC +00:00',
      trailer_id: "S_Pd2pGkq54"
      })
    end
    describe 'mailer' do 
      let(:mail) { UserMailer.invite_email(@party, [@friend1.id, @friend2.id])}
        it 'renders the headers' do
        expect(mail.subject).to eq("You've been invited to a ViewingParty!")
        expect(mail.to).to eq([@friend1.email, @friend2.email])
        expect(mail.from).to eq(['no-reply@email.com'])
        expect(mail.reply_to).to eq([@sending_user.email])
      end

      it 'renders the body' do
        expect(mail.text_part.body.to_s).to include('Thank you for using ViewingParty!')
        expect(mail.text_part.body.to_s).to include("You have been invited to watch Alice in Wonderland")
        expect(mail.html_part.body.to_s).to include('Thank you for using ViewingParty!')
        expect(mail.html_part.body.to_s).to include("You have been invited to watch Alice in Wonderland")
      end
    end
  end
end
