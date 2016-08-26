require_relative "../test_helper"

class ClientTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_root_url
    client = Client.create(
    root_url:"google.com",
    identifier: "google"
    )

    assert_equal "google.com", client.root_url
  end

  def test_it_has_an_identifier
    client = Client.create(
    root_url:"google.com",
    identifier: "google"
    )

    assert_equal "google", client.identifier
  end


  def test_unique_client
    Client.create(
      root_url:"google.com",
      identifier: "google"
    )
    other_client = Client.create(
      root_url:"google.com",
      identifier: "google"
    )

    refute other_client.save
  end

  def test_validates_identifier
    client = Client.create(
      root_url:"google.com"
    )
    refute client.valid?
  end

  def test_validates_root_url
    client = Client.create(
      identifier:"google.com"
    )
    refute client.valid?
  end

end
