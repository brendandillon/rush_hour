require_relative "../test_helper"

class ClientDisplayStatsTest < FeatureTest
  include TestHelpers

  def test_client_display_stats
    db_mock

    visit '/sources/apple'

    within('body') do
      assert page.has_content?("Apple Dashboard")
      assert page.has_content?("Average Response Time")
      assert page.has_content?("Most Frequent Request Type")
    end
  end

end
