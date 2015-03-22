class SignupMailer < ApplicationMailer
  default from: "john.marinelli.dev@gmail.com"

  def signup_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for signing up')
#    mg_client = Mailgun::Client.new ENV['mailgun_api_key']
#    message_params = {
#                        :from => ENV['mailer_email'],
#                        :to => @user.email,
#                        :subject => 'Sample email using mailgun',
#                        #:text => 'Sent by mailgun.'
#                        :html => render html: Rails.root.join('app', 'views', 'signup_mailer', 'signup_mail.html.erb').html_safe
#                     }
#    mg_client.send_message ENV['mailgun_domain'], message_params
  end
end
