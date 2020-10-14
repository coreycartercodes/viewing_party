class UserMailer < ApplicationMailer
  def invite_email(party_info, invitee_ids)
    @movie = party_info.title
    @runtime = party_info.runtime
    @datetime = party_info.datetime_of_party
    @host = party_info.user
    @attendees = invitee_ids.map do |id|
      if id!=""
        User.find(id).email
      end
    end.reject { |e| e.to_s.empty? }
    mail(
      reply_to: @host.email,
      to: @attendees,
      subject: "You've been invited to a ViewingParty!"
    )
  end
end
