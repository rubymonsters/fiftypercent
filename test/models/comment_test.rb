require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'Ensures title, author, body' do
    event = Event.new
    comment = event.comments.new
    assert_not comment.valid?
    assert_equal 3, comment.errors.count
  end
end

class CommentAssociationTest < ActiveSupport::TestCase
  test 'Events can have comments' do
    assert_kind_of Comment, events(:car_show).comments.new
  end

  test 'Car show has two comment from fixtures' do
    assert_equal(2, events(:car_show).comments.count)
  end
end
