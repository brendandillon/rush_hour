require_relative "../test_helper"

class RequestTypeTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_request_type
    reqtype = RequestType.create(
    verb:"GET"
    )

    assert_equal "GET", reqtype.verb
  end

  def test_request_type_must_be_unique
    RequestType.create(
      verb: "PUT"
    )
    other_rt = RequestType.create(
      verb: "PUT"
    )
    refute other_rt.save
  end

  def test_validates_verb
    verb = RequestType.create(
    verb:"PUT"
    )
    assert_equal true, verb.valid?
  end

  def test_it_returns_all_verbs
    RequestType.create(verb:"PUT")
    RequestType.create(verb:"GET")
    RequestType.create(verb:"POST")

    assert_equal "GET,POST,PUT", RequestType.list_all_verbs
  end

end
