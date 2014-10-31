class EventsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
    # there are two events in the fixtures
    assert_equal assigns(:events).size, 2
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
      post :create, event: valid_event_hash, user_id: users(:horst).id
    end
    assert_redirected_to event_path(assigns(:event))
    assert_equal 'Event was successfully created.', flash[:notice]
  end
end