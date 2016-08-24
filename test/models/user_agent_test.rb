require_relative "../test_helper"

class UserAgentTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_ips
    ua = UserAgent.create(
    user_agent:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17",
    )

    result = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17"
    assert_equal result, ua.user_agent
  end


end
