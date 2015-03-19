require 'test_helper'
require 'three_taps'


class ThreeTapsTest < ActiveSupport::TestCase
  def setup
    @tts = Search::ThreeTapsSearch.new
  end

  test "url is search endpoint" do
    assert_equal 'http://search.3taps.com?', @tts.endpoint
  end
  
  test "auth token is set" do
    assert_equal Search::Api_key, @tts.auth_token
  end
  
  test "search url is set" do
    assert_equal 'http://search.3taps.com?&auth_token=' + Search::Api_key, @tts.search_url
  end

  test "status is 200" do
    assert_equal '200', @tts.status
  end
end
