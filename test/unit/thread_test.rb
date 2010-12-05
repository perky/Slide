require 'test_helper'

class ThreadTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Thread.new.valid?
  end
end
