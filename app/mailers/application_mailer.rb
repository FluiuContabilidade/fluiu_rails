class ApplicationMailer < ActionMailer::Base
  default from: 'atendimento@fluiu.com.br'
  layout 'mailer'

  def event_notification_mail(user, event)
    @event = event
    @user = user
    mail(to: user.email, subject: '[Fluiu Contabilidade] - Aviso de evento: #{event}')
  end
end
