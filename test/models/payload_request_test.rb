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
    os_and_browser_id: 0,
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
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    )
    PayloadRequest.create(
    requested_at:"2013-02-16 21:38:30 -0700",
    responded_in:46,
    )
    assert_equal 41.5, PayloadRequest.avg_response_all
  end

  def test_max_response_time_all_requests
    PayloadRequest.create(
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    )
    PayloadRequest.create(
    requested_at:"2013-02-16 21:38:30 -0700",
    responded_in:46,
    )
    assert_equal 46, PayloadRequest.max_response_all
  end

  def test_min_response_time_all_requests
    PayloadRequest.create(
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
    )
    PayloadRequest.create(
    requested_at:"2013-02-16 21:38:30 -0700",
    responded_in:46,
    )
    assert_equal 37, PayloadRequest.min_response_all
  end
end
