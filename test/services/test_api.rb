require 'test_helper'

class APITest < ActiveSupport::TestCase
  def setup
    @search = Search::APISearch.new
    @poll = Search::APIPoll.new 1
    @poll_no_anchor = Search::APIPoll.new
    @poll_future_anchor = Search::APIPoll.new
    @poll_future_anchor.set_anchor 2
  end

  def test_search_url
    assert_equal 'http://search.3taps.com?&auth_token=' + Search::Api_key, @search.api_url
  end

  def test_poll_url_with_anchor
    assert_equal 'http://polling.3taps.com/poll?&auth_token=' + Search::Api_key + '&anchor=1', @poll.api_url
  end

  def test_poll_url_without_anchor
    assert_equal 'http://polling.3taps.com/poll?&auth_token=' + Search::Api_key, @poll_no_anchor.api_url
  end

  def test_poll_future_anchor
    assert_equal 2, @poll_future_anchor.parameters[:anchor]
  end
end
