require 'test_helper'

class PlayerClassTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PlayerClass.new.valid?
  end
end
