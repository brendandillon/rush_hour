require_relative '../test_helper'

class PayloadRequestTest < Minitest::Test

  include TestHelpers

  def create_payload_request
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    #need to fix UserAgent (browser and OS)
    #userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    "os_and_browser_id": 0,
    "resolution_id":0,
    "ip_id":0,
    )
  end

  def test_it_creates_a_payload_request
    create_payload_request

    assert PayloadRequest.exists?(1)
  end

  def test_it_has_a_requested_at_time
    pr = create_payload_request
    result = "2013-02-16 21:38:28 -0700"
    assert_equal result, pr.requested_at
  end

  def test_it_has_a_responded_in_value
    pr = create_payload_request

    assert_equal 37, pr.responded_in
  end

  def test_validates_responded_in
    pr = PayloadRequest.create(
    requested_at:"2013-02-16 21:38:28 -0700",
    )
    refute pr.valid?
  end

  def test_validates_requested_at
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_validates_url_id
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_validates_referred_by_id
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_validates_request_type_id
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_validates_user_agent_id
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_validates_resolution_id
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_validates_ip_id
    pr = PayloadRequest.create(
    responded_in:37,
    )
    refute pr.valid?
  end

  def test_avg_response_time_all_requests
    PayloadRequest.create(
    url_id:0,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )
    PayloadRequest.create(
    url_id:0,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:46,
    referred_by_id:0,
    request_type_id:0,
    #need to fix UserAgent (browser and OS)
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )
    assert_equal 41.5, PayloadRequest.avg_response_all
  end

  def test_max_response_time_all_requests
    PayloadRequest.create(
    url_id:0,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by_id:0,
    request_type_id:0,
    #need to fix UserAgent (browser and OS)
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )
    PayloadRequest.create(
    url_id:0,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:46,
    referred_by_id:0,
    request_type_id:0,
    #need to fix UserAgent (browser and OS)
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )
    assert_equal 46, PayloadRequest.max_response_all
  end
  def test_min_response_time_all_requests
    PayloadRequest.create(
    url_id:0,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by_id:0,
    request_type_id:0,
    #need to fix UserAgent (browser and OS)
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )
    PayloadRequest.create(
    url_id:0,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:46,
    referred_by_id:0,
    request_type_id:0,
    #need to fix UserAgent (browser and OS)
    os_and_browser_id:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_id:0,
    ip_id:0,
    )
    assert_equal 37, PayloadRequest.min_response_all
  end

  def test_it_fills_the_tables
    to_fill = {
      url:"http://jumpstartlab.com/blog",
      requested_at:"2013-02-16 21:38:28 -0700",
      responded_in:37,
      referred_by:"http://jumpstartlab.com",
      request_type:"GET",
      user_agent:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
      resolution_width:"1920",
      resolution_height:"1280",
      ip:"63.29.38.211"
    }
    pr = PayloadRequest.fill_tables(to_fill)
    assert_equal "http://jumpstartlab.com/blog", Url.find(pr.url_id).address
    assert_equal "63.29.38.211", IP.find(pr.ip_id).address
    assert_equal "http://jumpstartlab.com", ReferredBy.find(pr.referred_by_id).address
    assert_equal "GET", RequestType.find(pr.request_type_id).verb
    assert_equal 1920, Resolution.find(pr.resolution_id).resolution_width
    assert_equal 1280, Resolution.find(pr.resolution_id).resolution_height
    assert_equal "Macintosh", OsAndBrowser.find(pr.os_and_browser_id).operating_system
    assert_equal "Chrome", OsAndBrowser.find(pr.os_and_browser_id).browser
  end

  def test_it_returns_least_to_most_requested_url
    url_1 = Url.create(address:"http://jumpstartlab.com/blog")
    url_2 = Url.create(address:"https://www.facebook.com")

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:0,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id: 0,
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_2.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:0,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id: 0,
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_2.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:0,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id: 0,
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_2.id,
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:0,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id: 0,
    resolution_id:0,
    ip_id:0,
    )

    PayloadRequest.create(
    url_id: url_1.id,
    requested_at: "2013-02-16 21:38:28 -0700",
    responded_in:0,
    referred_by_id:0,
    request_type_id:0,
    os_and_browser_id: 0,
    resolution_id:0,
    ip_id:0,
    )

    expected = "https://www.facebook.com, http://jumpstartlab.com/blog"
    assert_equal expected, PayloadRequest.all_urls_most_to_least_requested
  end

  def test_breaks_down_browser_use_across_requests
    oab = OsAndBrowser.create(
      "browser":"Chrome",
      "operating_system":"Windows"
    )
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    "os_and_browser_id": oab.id,
    "resolution_id":0,
    "ip_id":0,
    )
    oab_two = OsAndBrowser.create(
      "browser": "Firefox",
      "operating_system":"Macintosh"
    )
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    "os_and_browser_id": oab_two.id,
    "resolution_id":0,
    "ip_id":0,
    )

    expected = {"Chrome" => 1, "Firefox" => 1}

    assert_equal expected, PayloadRequest.browser_use_across_requests
  end

  def test_breaks_down_operating_system_across_requests
    oab = OsAndBrowser.create(
      "browser":"Chrome",
      "operating_system":"Windows"
    )
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    "os_and_browser_id": oab.id,
    "resolution_id":0,
    "ip_id":0,
    )
    oab_two = OsAndBrowser.create(
      "browser": "Firefox",
      "operating_system":"Macintosh"
    )
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    "os_and_browser_id": oab_two.id,
    "resolution_id":0,
    "ip_id":0,
    )

    expected = {"Macintosh" => 1, "Windows" => 1}

    assert_equal expected, PayloadRequest.operating_system_use_across_requests
  end

  def test_breaks_down_screen_resolution_across_requests
    res = Resolution.create(
      "resolution_width":1080,
      "resolution_height":900
    )
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    "os_and_browser_id":0,
    "resolution_id":res.id,
    "ip_id":0,
    )
    res_two = Resolution.create(
      "resolution_width":100,
      "resolution_height":100
    )
    PayloadRequest.create(
    "url_id":0,
    "requested_at":"2013-02-16 21:38:28 -0700",
    "responded_in":37,
    "referred_by_id":0,
    "request_type_id":0,
    "os_and_browser_id":0,
    "resolution_id":res_two.id,
    "ip_id":0,
    )


    expected = {[1080, 900] => 1, [100, 100] => 1}

    assert_equal expected, PayloadRequest.resolution_across_requests
  end

end
