# Copyright © Mapotempo, 2013-2018
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
module PlanningsByDestinationsHelper
  def vehicles_array_by_planning
    @customer.plannings.map{ |planning| planning_vehicles_array(planning) }
  end

  def vehicles_usages_by_planning
    @customer.plannings.map{ |planning| [planning.id, planning_vehicles_usages_map(planning)] }.to_h
  end

  def quantities_by_planning
    @customer.plannings.map{ |planning| [planning.id, planning_quantities(planning)] }.to_h
  end

  def active_vehicles
    @customer.vehicles.reject{ |vehicle| vehicle.vehicle_usages.map(&:active).uniq == [false] }
  end
end
