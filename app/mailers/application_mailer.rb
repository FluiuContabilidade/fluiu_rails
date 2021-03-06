class ApplicationMailer < ActionMailer::Base
  default from: 'atendimento@fluiu.com.br'
  layout 'mailer'

  def event_notification_mail(user, event)
    @event = event
    @user = user
    mail(to: user.email, subject: '[Fluiu Contabilidade] - Aviso de evento: #{event}')
  end

  def opening_status_change(user,message)
    @user = user
    @message = message
    mail(to: 'comercial@fluiu.com.br' , subject: " [#{user.company}] - Mudança de Status de Abertura")
  end

  def invoices_reminder_mail(user, date)
    @user = user
    @date = date
    mail(to: user.email, subject: '[Fluiu Contabilidade] - Envio de Notas Fiscais ')
  end

end
