require_relative "../test_helper"

class ClientDisplayStatsForSpecificUrlTest < FeatureTest
  include TestHelpers

  def test_clients_display_stats_for_specific_url
    db_mock

    visit '/sources/jumpstartlab/urls/blog'

    within('body') do
      assert page.has_content?("Jumpstartlab Blog Dashboard")
      assert page.has_content?("Three Most Popular Referrers")
      assert page.has_content?("Three Most Popular UserAgents")
    end
  end

end
