class NotificationsMailer < ActionMailer::Base
  #default from: 'speakerInnen@gmail.com'

  def new_event(event)
    @event = event
    @url = 'nix'
    mail(to: 'tyranja@speakerinnen.org', subject: 'New Event in 50 percent')
  end

end
