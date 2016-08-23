require_relative '../test_helper'

class PayloadRequestTest < Minitest::Test

  include TestHelpers

  def create_payload_request
    PayloadRequest.create(
    url:"http://jumpstartlab.com/blog",
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by:"http://jumpstartlab.com",
    request_type:"GET",
    user_agent:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_width:"1920",
    resolution_height:"1280",
    ip:"63.29.38.211"
    )
  end

  def test_it_creates_a_payload_request
    create_payload_request

    assert PayloadRequest.exists?(1)
  end

  def test_it_has_a_url
    pr = create_payload_request

    assert_equal "http://jumpstartlab.com/blog", pr.url
  end

  def test_it_has_a_requested_at_time
    pr = create_payload_request

    assert_equal Time.new(2013, 02, 17, 04, 38, 28, "-00:00"), pr.requested_at
  end

  def test_it_has_a_responded_in_value
    pr = create_payload_request

    assert_equal 37, pr.responded_in
  end

  def test_it_has_a_referred_by_value
    pr = create_payload_request

    assert_equal "http://jumpstartlab.com", pr.referred_by
  end

  def test_it_has_a_request_type
    pr = create_payload_request

    assert_equal "GET", pr.request_type
  end

  def test_it_has_a_user_agent
    pr = create_payload_request

    assert_equal "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17", pr.user_agent
  end

  def test_it_has_a_resolution_width
    pr = create_payload_request

    assert_equal 1920, pr.resolution_width
  end

  def test_it_has_a_resolution_height
    pr = create_payload_request

    assert_equal 1280, pr.resolution_height
  end

  def test_it_has_an_ip_address
    pr = create_payload_request

    assert_equal "63.29.38.211", pr.ip
  end

  def test_validates_url
    pr = PayloadRequest.create(
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by:"http://jumpstartlab.com",
    request_type:"GET",
    user_agent:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    resolution_width:"1920",
    resolution_height:"1280",
    ip:"63.29.38.211"
    )
    refute pr.valid?
  end

  def test_validates_user_agent
    pr = PayloadRequest.create(
    url:"http://jumpstartlab.com/blog",
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    referred_by:"http://jumpstartlab.com",
    request_type:"GET",
    resolution_width:"1920",
    resolution_height:"1280",
    ip:"63.29.38.211"
    )
    refute pr.valid?
  end
end
