require_relative "../test_helper"

class RequestTypeTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_request_type
    reqtype = RequestType.create(
    request_type:"GET"
    )

    assert_equal "GET", reqtype.request_type
  end

end
