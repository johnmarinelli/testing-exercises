require 'test_helper'

class WordTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  def test_word_is_english
    w = Word.new :eng=>'never', :spa=>'nunca'
    assert_equal 'never', w.eng
  end
  
  def test_word_is_english_and_spanish
    w = Word.new :eng=>'never', :spa=>'nunca'
    assert_equal 'never', w.eng
    assert_equal 'nunca', w.spa
  end

  def test_third_word_is_spanish
    assert_equal 'Hola', words(:three).spa, 'Word three isn\'t Hola'
  end

  test "word_count" do
    assert_equal 3, Word.count
  end
end
