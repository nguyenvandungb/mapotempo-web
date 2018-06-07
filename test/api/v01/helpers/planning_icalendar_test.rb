require 'test_helper'
require 'planning_icalendar'

class V01::CustomerTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  @@TIMEZONE_PATTERN = /\d{8}T\d{6}Z/

  setup do
    @current_user = users(:user_one)
  end

  def app
    Rails.application
  end

  test 'should use current user time zone' do
    planning = plannings(:planning_one)
    Time.zone = @current_user.time_zone # Hawaii

    ical = plannings_calendar([planning]).to_ical.to_s
    with_timezone = ical.scan(/Pacific.{1}Honolulu/m)

    assert_equal 'Pacific/Honolulu', with_timezone.first
  end

  test 'should set timezone for all VEVENT' do
    planning = plannings(:planning_one)

    ical = plannings_calendar([planning]).to_ical.to_s
    with_timezone = ical.scan(@@TIMEZONE_PATTERN)

    assert with_timezone.count, planning.routes.count
  end

  test 'should set the time with HST -10:00' do
    route = routes(:route_one_one)
    Time.zone = @current_user.time_zone
    stop_time = 350

    time = p_time(route, stop_time)

    assert_equal -10, (time.utc_offset / 3600)
  end

  test 'should set the time with UTC 0' do
    route = routes(:route_one_one)
    Time.zone = 'UTC'
    stop_time = 350

    time = p_time(route, stop_time)

    assert_equal 0, time.utc_offset
  end
end
