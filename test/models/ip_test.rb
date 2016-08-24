require_relative "../test_helper"

class IPTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_ips
    ips = IP.create(
    address:"63.29.38.211"
    )

    assert_equal "63.29.38.211", ips.address
  end

  def test_address_must_be_unique
    ip = IP.create(
      address:"63.29.38.211"
    )
    other_ip = IP.create(
      address:"63.29.38.211"
    )

    refute other_ip.save
  end

  def test_validates_address
    ips = IP.create(
    address:"63.29.38.211"
    )
    assert_equal true, ips.valid?
  end


end
