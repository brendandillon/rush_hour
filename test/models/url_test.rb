require_relative "../test_helper"

class URLTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_url
    urls = URL.create(
    address:"http://jumpstartlab.com/blog"
    )

    assert_equal "http://jumpstartlab.com/blog", urls.address
  end


end
