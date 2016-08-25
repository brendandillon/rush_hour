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

  def test_min_response_time
    url_1 = Url.create(address:"http://jumpstartlab.com/blog")
    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:40,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    assert_equal 40, Url.max_response(url_1.id)
  end

  def test_max_response_time
    url_1 = Url.create(address:"http://jumpstartlab.com/blog")
    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:40,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    assert_equal 37, Url.min_response(url_1.id)
  end


  def test_max_response_time
    url_1 = Url.create(address:"http://jumpstartlab.com/blog")
    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:40,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:38,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:39,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )

    assert_equal [37, 38, 39, 40], Url.response_time_list(url_1.id)
  end



end
