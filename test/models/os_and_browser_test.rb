require_relative "../test_helper"

class OsAndBrowserTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_ips
    skip
    ua = OsAndBrowser.create(
    address:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    )

    result = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17"
    assert_equal result, ua.address
  end


  def test_a_user_agent_is_unique
    ua = OsAndBrowser.create(
      browser: "Chrome/24.0.1309.0",
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )
    other_ua = OsAndBrowser.create(
      browser: "Chrome/24.0.1309.0",
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )

    refute other_ua.save
  end


  def test_validates_browser
  end

  def test_validates_os
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

    assert_equal expected, OsAndBrowser.browser_use_across_requests
  end


end
