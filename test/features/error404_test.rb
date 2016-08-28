require_relative "../test_helper"

class Error404Test < FeatureTest

  def test_return_client_does_not_exist_when_path_is_not_clear
    #not passing database,  that is why it gives 404

    visit '/sources'
      within('body') do
        assert page.has_content?("The page you were looking for could not be found.")
      end
    assert_equal "/sources", current_path
  end

end
