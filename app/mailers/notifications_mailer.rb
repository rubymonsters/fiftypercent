class NotificationsMailer < ActionMailer::Base
 default from: 'admina@speakerinnen.org'

  def new_event(event)
    @event = event
    @url = 'https://50prozent.speakerinnen.org/log_in'
    mail(to: 'admina@speakerinnen.org, anne@speakerinnen.org', subject: 'New Event in 50 percent')
  end

end
