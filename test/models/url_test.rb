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

  def test_returns_max_response
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal 57, Url.max_response(url_1.id)
  end

  def test_returns_min_response
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal 37, Url.min_response(url_1.id)
  end

  def test_returns_response_time_list
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal [37, 47, 57], Url.response_time_list(url_1.id)
  end

  def test_average_response
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal 47, Url.average_response(url_1.id)
  end


end
