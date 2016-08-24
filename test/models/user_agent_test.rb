require_relative "../test_helper"

class UserAgentTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_ips
    skip
    ua = UserAgent.create(
    address:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    )

    result = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17"
    assert_equal result, ua.address
  end

  def test_validates_browser
  end

  def test_validates_os
  end

end
