require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
    # there are two events in the fixtures
    assert_equal assigns(:events).size, 2
  end

  test "index should only show published events" do
    get :index
    assert_includes assigns(:events), events(:car_show)
    assert_not_includes assigns(:events), events(:cebit)
  end



  test "show action loads the right event" do
    get :show, id: events(:car_show).id
    assert_equal assigns(:event), events(:car_show)
  end

  test "show action redirects to index on unpublished event" do
    get :show, id: events(:cebit).id
    assert_redirected_to events_path
  end
  
  test "show action shows unpublished event to the author" do
    event = Event.create(valid_event_hash)
    get :show, {id: event.id}, {reported_events_ids: [event.id]}
    assert_template :show
  end

  test "show action does not show unpublished event to the author if event to old" do
    event = Event.create(valid_event_hash)
    event.update_attributes(created_at: 2.days.ago)
    get :show, {id: event.id}, {reported_events_ids: [event.id]}
    assert_redirected_to events_path
  end



  test "search should show published events" do
    get :index, {q: "car"}
    assert_includes assigns(:events), events(:car_show)
  end

  test "search should not show UNpublished events" do
    get :index, {q: "CeBit"}
    assert_empty assigns(:events)
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: valid_event_hash
    end
    assert_redirected_to event_path(assigns(:event))
    assert_equal 'Event was successfully created.', flash[:notice]
  end

  test 'should store event-id of created event in an array in the users session' do
    post :create, event: valid_event_hash
    new_event_id = Event.where(title: 'New Event').first.id
    assert_includes session[:reported_events_ids], new_event_id
  end

  test 'should store event-id of a second event in an array in the users session' do
    post :create, event: valid_event_hash
    post :create, event: valid_event_hash.merge(title: 'Title Two')
    new_event_id    = Event.where(title: 'New Event').first.id
    second_event_id = Event.where(title: 'Title Two').first.id
    assert_includes session[:reported_events_ids], new_event_id
    assert_includes session[:reported_events_ids], second_event_id
    assert_equal 2, session[:reported_events_ids].size
  end

  test 'edit action if event is frontend_editable?' do
    event = Event.create(valid_event_hash)
    event.update_attributes created_at: 2.minutes.ago
    get :edit, {id: event.id}, {reported_events_ids: [event.id]}
    assert_template :edit
    assert_template layout: "layouts/application"
  end

  test 'no edit form if event is NOT frontend_editable?' do
    get :edit, id: events(:car_show).id, reported_events_ids: [123]
    assert_redirected_to events_path
    assert_match 'you cannot edit this event', flash[:error]
  end

end

