require 'test_helper'

class RongCloudTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RongCloud::VERSION
  end
end
