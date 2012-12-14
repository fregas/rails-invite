class InviteeMailer < ActionMailer::Base
  default :from => "craig@bowesfamily.com"

  def invitation_email(invitee,url) 
    @invitee = invitee
    @url = url 
    mail( :to => @invitee.email, :reply_to => 'craig@bowesfamily.com', :subject => "Craig's Graduation Party!")
  end  
end
