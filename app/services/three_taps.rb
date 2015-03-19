# app/services/ThreeTapsAPI.rb
require 'open-uri'
require_relative 'api_key'

# helper function to append get vars to the 3taps endpoint
def append_get_vars(url, args)
  if url[-1, 1] != '?' then
    url[-1, 1] << '?'
  end

  args.each do |k, v|
    url << '&' << k.to_s << '=' << v.to_s
  end

  url
end

module Search
  # base class that will hold common search parameters, auth token
  class ThreeTapsAPI
    attr_reader :search_url
    attr_reader :endpoint
    attr_reader :auth_token

    attr_reader :parameters

    def initialize
      @auth_token = Search::Api_key

      @parameters = {
        :category => nil,
        :category_group => nil,

        :location => {
          :zipcode => nil,
          :city => nil,
          :state => nil,
          :country => nil,
          :everywhere => false
        },

        :price_min => nil,
        :price_max => nil,

        :begin_date => nil,
        :end_date => nil
      }
    end

    def status
      open(@endpoint).status
    end
  end

  # handles search endpoint for 3taps api
  class ThreeTapsSearch < ThreeTapsAPI
    def initialize
      super
      @endpoint = "http://search.3taps.com?"
      @search_url = append_get_vars(@endpoint.clone, {'auth_token' => @auth_token})
    end
  end
end
