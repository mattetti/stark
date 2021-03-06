require 'test/unit'

require 'stark'

require 'rubygems'
require 'thrift'

class TestSpark < Test::Unit::TestCase

  def test_materialize_parsing_errors
    file_path = File.join(File.dirname(__FILE__), 'parsing_error.thrift')
    begin
     Stark.materialize file_path
    rescue => e
      error = e
    end
    assert(error, "A parsing exception should have been raised")
    assert_equal(Stark::Parser::ParseError, error.class)
    assert e.message.include?(file_path)
  end

end
