require_relative "../test_helper"

class UrlTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_url
    urls = Url.create(
    address:"http://jumpstartlab.com/blog"
    )

    assert_equal "http://jumpstartlab.com/blog", urls.address
  end

  def test_validates_address
    address = Url.create(
    address:"http://jumpstartlab.com/blog")
    assert_equal true, address.valid?
  end

  def test_addresses_must_be_unique
    address = Url.create(
    address:"http://jumpstartlab.com/blog"
    )
    other_address = Url.create(
    address:"http://jumpstartlab.com/blog"
    )

    refute other_address.save
  end

end
