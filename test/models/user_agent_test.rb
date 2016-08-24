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

  def test_a_user_agent_is_unique
    ua = UserAgent.create(
      browser: "Chrome/24.0.1309.0",
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )
    other_ua = UserAgent.create(
      browser: "Chrome/24.0.1309.0",
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )
    
    refute other_ua.save
  end


end
