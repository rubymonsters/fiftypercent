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
  
  test "search should show published events" do
    get :index, {q: "car"}
    assert_includes assigns(:events), events(:car_show)
  end

  test "search should not show UNpublished events" do
    get :index, {q: "CeBit"}
    assert_empty assigns(:events)
  end

  valid_event_hash = {
    title: 'New Event',
    date: Time.now,
    city: 'Some Town',
    country_code: 'US',
    main_url: 'http://www.heise.de',
    total: 200,
    woman: 10,
    reporter: 'hosts'
  }

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
  
end
  
