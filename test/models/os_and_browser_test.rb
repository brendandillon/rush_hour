require_relative "../test_helper"

class OsAndBrowserTest < Minitest::Test
  include TestHelpers

  def test_it_has_an_os
    oab = OsAndBrowser.create(
      operating_system: "Macintosh; Intel Mac OS X 10_8_2",
      browser: "Chrome"
    )

    assert_equal "Macintosh; Intel Mac OS X 10_8_2", oab.operating_system
  end

  def test_it_has_a_browser
    oab = OsAndBrowser.create(
      operating_system: "Macintosh; Intel Mac OS X 10_8_2",
      browser: "Chrome"
    )

    assert_equal "Chrome", oab.browser
  end

  def test_a_user_agent_is_unique
    OsAndBrowser.create(
      browser: "Chrome",
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )
    other_oab = OsAndBrowser.create(
      browser: "Chrome",
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )

    refute other_oab.save
  end


  def test_validates_browser
    oab = OsAndBrowser.create(
      operating_system: "Macintosh; Intel Mac OS X 10_8_2"
    )

    refute oab.save
  end

  def test_validates_os
    oab = OsAndBrowser.create(
      browser: "Chrome",
    )

    refute oab.save
  end
end
