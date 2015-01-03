require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Ensures title, author, body' do
    comment = Comment.new
    assert_not comment.valid?
    assert_equal 3, comment.errors.count
  end
end



class CommentAssociationTest < ActiveSupport::TestCase
  test 'Events can have comments' do
    assert_kind_of Comment, events(:car_show).comments.new
  end
end
