require 'test_helper'

class CreditEntryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CreditEntry.new.valid?
  end
end
