# Copyright © Mapotempo, 2018
#
# This file is part of Mapotempo.
#
# Mapotempo is free software. You can redistribute it and/or
# modify since you respect the terms of the GNU Affero General
# Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# Mapotempo is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the Licenses for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Mapotempo. If not, see:
# <http://www.gnu.org/licenses/agpl.html>
#

class DistanceUnits
  def self.meters_to_miles(meters)
    meters = meters.to_f unless meters.is_a? Numeric
    self.meters_to_kms(meters) * 0.62137 unless meters.zero?
  end

  def self.meters_to_kms(meters)
    meters = meters.to_f unless meters.is_a? Numeric
    meters / 1000.to_f unless meters.zero?
  end

  def self.miles_to_meters(miles)
    miles = miles.to_f unless miles.is_a? Numeric
    (miles / 0.62137 * 1000).to_i unless miles.zero?
  end

  def self.kms_to_meters(kms)
    kms = kms.to_f unless kms.is_a? Numeric
    (kms * 1000).to_i unless kms.zero?
  end

  def self.distance_to_meters(distance, unit)
    distance = distance.to_f unless distance.is_a? Numeric
    unit == 'mi' ? DistanceUnits.miles_to_meters(distance.to_f).round(2) : DistanceUnits.kms_to_meters(distance.to_f).round(2) unless distance.zero?
  end
end
