require_relative "../test_helper"

class URLTest < Minitest::Test
  include TestHelpers
  
  def test_it_has_a_url
    urls = URL.create(
    url:"http://jumpstartlab.com/blog"
    )

    assert_equal "http://jumpstartlab.com/blog", urls.url
  end
  
  def test_addresses_must_be_unique
    address = URL.create(
    address:"http://jumpstartlab.com/blog"
    )
    other_address = URL.create(
    address:"http://jumpstartlab.com/blog"
    )
    
    refute other_address.save
  end


end
