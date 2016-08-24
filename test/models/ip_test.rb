require_relative "../test_helper"

class IPTest < Minitest::Test

  def test_it_has_a_url
    ips = IP.create(
    address:"63.29.38.211"
    )

    assert_equal "63.29.38.211", ips.address
  end


end
