require 'test_helper'

class SpecialCreditTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SpecialCredit.new.valid?
  end
end
