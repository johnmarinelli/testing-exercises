# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class SignupMailerPreview < ActionMailer::Preview
  def signup_mailer_preview
    SignupMailer.signup_mail(User.first)
  end
end
