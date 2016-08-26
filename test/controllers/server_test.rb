require_relative '../test_helper'

class ServerControllerTest < Minitest::Test
  include TestHelpers
  
  def test_it_can_create_a_client
    post '/sources', {"rootUrl" => "abc.com", "identifier" => "abc"}
    assert_equal 200, last_response.status
    assert_equal "Success", last_response.body
  end

  def test_it_knows_about_missing_parameters
    post '/sources', {"rootUrl" => "abc.com"}

    assert_equal 400, last_response.status
    assert_equal "Missing Parameters", last_response.body
  end

  def test_it_knows_when_an_identifier_exists
    post '/sources', {"rootUrl" => "abc.com", "identifier" => "abc"}
    post '/sources', {"rootUrl" => "abc.com", "identifier" => "abc"}
    assert_equal 403, last_response.status
    assert_equal "Identifier Already Exists", last_response.body
  end
end
