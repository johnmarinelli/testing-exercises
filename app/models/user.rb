class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after create, send an email
  after_create :send_signup_email
  
  def send_signup_email
    SignupMailer.signup_mail(self).deliver
  end

end
