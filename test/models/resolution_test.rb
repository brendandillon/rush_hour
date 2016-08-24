require_relative '../test_helper'

class ResolutionTest < Minitest::Test
  include TestHelpers

  def test_it_has_a_resolution_width
    resolutions = Resolution.create(
    resolution_width:"1920",
    resolution_height:"1280")

    assert_equal 1920,resolutions.resolution_width
  end

  def test_it_has_a_resolution_height
    resolutions = Resolution.create(
    resolution_width:"1920",
    resolution_height:"1280")

    assert_equal 1280,resolutions.resolution_height
  end

  def test_validates_resolution_width
    resolutions = Resolution.create(
    resolution_height:"1280")
    refute resolutions.valid?
  end

  def test_validates_resolution_height
    resolutions = Resolution.create(
    resolution_width:"1920")
    refute resolutions.valid?
  end


end
