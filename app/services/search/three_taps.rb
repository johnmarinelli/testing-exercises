# app/services/ThreeTapsAPI.rb
require 'api_key'
require('open-uri')

# helper function to append get vars to the 3taps endpoint
def append_get_vars(url, args)
  if url[-1, 1] != '?' then
    url[-1, 1] << '?'
  end

  args.each do |k, v|
    # TODO
    # find way to recursively dive into a hash and build a url
    if not k.instance_of? Hash
      url << '&' << k.to_s << '=' << v.to_s
    end
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

#        :location => {
#          :zipcode => nil,
#          :city => nil,
#          :state => nil,
#          :country => nil,
#          :everywhere => false
#        },

        :price_min => nil,
        :price_max => nil,

        :begin_date => nil,
        :end_date => nil
      }
    end

    def status
      open(@endpoint).status
    end

    def set_params(params)
      @parameters.merge! params
    end
  end

  # handles search endpoint for 3taps api
  class ThreeTapsSearch < ThreeTapsAPI
    def initialize
      super
      @endpoint = "http://search.3taps.com?"
      @search_url = append_get_vars(@endpoint.clone, {'auth_token' => @auth_token})
    end

    def search
      @endpoint = append_get_vars @search_url.clone, @parameters
      open(@endpoint).read
    end
  end
end
