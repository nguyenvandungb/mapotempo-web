require 'test_helper'

class RoutesByVehiclesTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  setup do
    @vehicle = vehicles(:vehicle_one)
  end

  test 'should return json for routes' do
    get "/routes_by_vehicles/#{@vehicle.id}.json?api_key=testkey1"
    assert last_response.ok?, last_response.body
    json = JSON.parse(last_response.body)
    assert_equal @vehicle.customer.plannings.size, json['routes'].size
  end
end
