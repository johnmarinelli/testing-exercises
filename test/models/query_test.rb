require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  def test_query_one_category_is_APET
    assert_equal "APET", queries(:one).category 
  end
end
