require 'test_helper'

class ForumPostTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ForumPost.new.valid?
  end
end
