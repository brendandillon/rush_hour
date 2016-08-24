require_relative '../test_helper'

class PayloadRequestTest < Minitest::Test

  include TestHelpers

  def create_payload_request
    PayloadRequest.create(
    requested_at:"2013-02-16 21:38:28 -0700",
    responded_in:37,
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
