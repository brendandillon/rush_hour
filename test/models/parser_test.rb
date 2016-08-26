require_relative '../test_helper'

class ParserTest < Minitest::Test

  def test_it_can_parser_json
    payload = '{"url":"http://jumpstartlab.com/blog","requestedAt":"2013-02-16 21:38:28 -0700","respondedIn":37,"referredBy":"http://jumpstartlab.com","requestType":"GET","userAgent":"Mozilla/5.0 (Macintosh%3B Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17","resolutionWidth":"1920","resolutionHeight":"1280","ip":"63.29.38.211"}'

    assert_equal "63.29.38.211",  Parser.new.parse(payload)[:ip]
    assert_equal "http://jumpstartlab.com/blog",  Parser.new.parse(payload)[:url]
    assert_equal 37,  Parser.new.parse(payload)[:responded_in]
  end

end
