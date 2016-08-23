require_relative '../test_helper'

class PayloadRequestTest < Minitest::Test

  include TestHelpers

  def test_it_has_a_url
    PayloadRequest.create(
      url:"http://jumpstartlab.com/blog"
    )

      assert PayloadRequest.exists(1)

    assert_equal 0, pr.all
    # assert_equal "http://jumpstartlab.com/blog", pr.url
  end
end
