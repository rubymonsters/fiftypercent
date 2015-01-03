require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test 'valid comments redirect to event-show action' do
    event_id = events(:car_show).id
    post :create, {comment: {title: 'A title', author: 'The Author', body: 'A comment body.'},
                   event_id: event_id
                  }
    assert_redirected_to event_path(event_id)
  end

  test 'valid comments are saved' do
    event_id = events(:car_show).id
    assert_difference 'events(:car_show).comments.count' do
      post :create, {comment: {title: 'A title', author: 'The Author', body: 'A comment body.'},
                     event_id: event_id}
    end
  end

  test 'adding a comment to a missing event throws an error' do
    event_id = 666
    assert_raises ActiveRecord::RecordNotFound do
      post :create, {comment: {title: 'A title', author: 'The Author', body: 'A comment body.'},
                     event_id: event_id}
    end
  end

  test 'invalid comments render the event-show view' do
    event_id = events(:car_show).id
    post :create, {comment: {title: 'A title'},
                   event_id: event_id
                  }

    assert_not_nil assigns(:event)
    assert_not_nil assigns(:comment)
    assert_template 'events/show'
  end

end