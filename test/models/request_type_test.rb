require_relative "../test_helper"

class RequestTypeTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_request_type
    reqtype = RequestType.create(
    request_type:"GET"
    )

    assert_equal "GET", reqtype.request_type
  end

  def test_most_frequent_request_type
    RequestType.create(
    request_type:"GET"
    )
    RequestType.create(
    request_type:"GET"
    )
    RequestType.create(
    request_type:"PUT"
    )
    assert_equal "GET", RequestType.most_frequent_type
  end

  def test_most_frequent_request_type_2
    RequestType.create(
    request_type:"PUT"
    )
    RequestType.create(
    request_type:"PUT"
    )
    RequestType.create(
    request_type:"GET"
    )
    RequestType.create(
    request_type:"GET"
    )
    assert_equal "GET", RequestType.most_frequent_type
  end

  def test_most_frequent_request_type_3
    RequestType.create(
    request_type:"PUT"
    )
    RequestType.create(
    request_type:"GET"
    )
    RequestType.create(
    request_type:"PUT"
    )
    RequestType.create(
    request_type:"PUT"
    )
    assert_equal "PUT", RequestType.most_frequent_type
  end

  def test_request_type_must_be_unique
    rt = RequestType.create(
      verb: "PUT"
    )
    other_rt = RequestType.create(
      verb: "PUT"
    )
    refute other_rt.save
  end

end
