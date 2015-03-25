require 'three_taps'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after create, send an email
  after_create :send_signup_email

  # has many queries
  has_many :queries
  
  def send_signup_email
    SignupMailer.signup_mail(self).deliver
  end

  def do_scheduled_query
    queries = self.queries
    tts = Search::ThreeTapsSearch.new

    queries.each do |q|
      tts.set_params({
        :category => q.category,
        :price_max => q.price_max,
#        :location => {
#          :country => q.location_country
#        }
      })

      data = JSON.parse tts.search

      QueryMailer.query_mail(self, data).deliver
    end
  end

end
