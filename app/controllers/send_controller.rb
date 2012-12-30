class SendController < ApplicationController
  before_filter :get_data

  def index
  end

  def submit
    @invitees.each do |i|
      url = "#{request.protocol}#{request.host_with_port}/?id=#{i.unique_id}"
      InviteeMailer.invitation_email(i,url).deliver()
      i.sent_invite_at = Time.new
      i.save
    end

    redirect_to '/send'

  end

  private 
  def get_data
    @invitees = Invitee.where(:sent_invite_at => nil)

  end
end
