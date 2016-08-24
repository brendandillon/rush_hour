require_relative "../test_helper"

class RequestTypeTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_request_type
    reqtype = RequestType.create(
    verb:"GET"
    )

    assert_equal "GET", reqtype.verb
  end

  def test_most_frequent_request_type
    RequestType.create(
    verb:"GET"
    )
    RequestType.create(
    verb:"GET"
    )
    RequestType.create(
    verb:"PUT"
    )
    assert_equal "GET", RequestType.most_frequent_type
  end

  def test_most_frequent_request_type_2
    RequestType.create(
    verb:"PUT"
    )
    RequestType.create(
    verb:"PUT"
    )
    RequestType.create(
    verb:"GET"
    )
    RequestType.create(
    verb:"GET"
    )
    assert_equal "GET", RequestType.most_frequent_type
  end

  def test_most_frequent_request_type_3
    RequestType.create(
    verb:"PUT"
    )
    RequestType.create(
    verb:"GET"
    )
    RequestType.create(
    verb:"PUT"
    )
    RequestType.create(
    verb:"PUT"
    )
    assert_equal "PUT", RequestType.most_frequent_type
  end

  def test_validates_verb
    verb = RequestType.create(
    verb:"PUT"
    )
    assert_equal true, verb.valid?
  end
end
