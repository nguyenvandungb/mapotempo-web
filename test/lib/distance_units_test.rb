require 'test_helper'

require 'distance_units'
class DistanceUnitsTest < ActionController::TestCase
  test 'should convert miles to meters and vice versa' do
    assert_equal 51499, DistanceUnits.miles_to_meters(32)
    assert_equal 51499, DistanceUnits.miles_to_meters('32')
    assert_nil DistanceUnits.miles_to_meters(nil)
    assert_nil DistanceUnits.miles_to_meters('')
    assert_equal 31.99993363, DistanceUnits.meters_to_miles(51499)
    assert_equal 31.99993363, DistanceUnits.meters_to_miles('51499')
    assert_nil DistanceUnits.meters_to_miles(nil)
    assert_nil DistanceUnits.meters_to_miles('')
    assert_equal 51000, DistanceUnits.kms_to_meters(51)
    assert_equal 51000, DistanceUnits.kms_to_meters('51')
    assert_nil DistanceUnits.kms_to_meters(nil)
    assert_nil DistanceUnits.kms_to_meters('')
    assert_equal 51, DistanceUnits.meters_to_kms(51000)
    assert_equal 51, DistanceUnits.meters_to_kms('51000')
    assert_nil DistanceUnits.meters_to_kms(nil)
    assert_nil DistanceUnits.meters_to_kms('')
  end
end
