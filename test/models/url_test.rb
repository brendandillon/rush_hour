require_relative "../test_helper"

class URLTest < Minitest::Test

  def test_it_has_a_url
    urls = URL.create(
    url:"http://jumpstartlab.com/blog"
    )

    assert_equal "http://jumpstartlab.com/blog", urls.url
  end


end
