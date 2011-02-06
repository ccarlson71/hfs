require 'test_helper'

class PlayerEventTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PlayerEvent.new.valid?
  end
end
