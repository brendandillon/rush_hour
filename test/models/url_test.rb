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
    Url.create(
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
    assert_equal 57, url_1.max_response
  end

  def test_returns_min_response
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal 37, url_1.min_response
  end

  def test_returns_response_time_list
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal [37, 47, 57], url_1.response_time_list
  end

  def test_average_response
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal 47, url_1.average_response
  end

  def test_returns_all_verbs_associated_with_url
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    assert_equal ["GET"], url_1.http_verbs
  end

  def test_returns_top_three_referrers
    db_mock

    url_1 = Url.find_by(address: "http://jumpstartlab.com/blog")
    expected = ["http://jumpstartlab.com/apply", "http://jumpstartlab.com"]
    assert_equal expected , Url.top_three_referrers(url_1.id)
  end

  def test_returns_top_three_user_agents
    db_mock

    url_1 = Url.find_by(address: "http://apple.com/buy")
    expected = ["OS: Macintosh%3B Intel Mac OS X 10_8_2 || Browser: Chrome", "OS: Windows || Browser: Internet Explorer"]
    assert_equal expected, Url.top_three_user_agents(url_1.id)
  end

end
