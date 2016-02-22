// Copyright © Mapotempo, 2013-2015
//
// This file is part of Mapotempo.
//
// Mapotempo is free software. You can redistribute it and/or
// modify since you respect the terms of the GNU Affero General
// Public License as published by the Free Software Foundation,
// either version 3 of the License, or (at your option) any later version.
//
// Mapotempo is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.  See the Licenses for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with Mapotempo. If not, see:
// <http://www.gnu.org/licenses/agpl.html>
//

var vehicle_usages_form = function(params) {
  $('#vehicle_usage_open, #vehicle_usage_close, #vehicle_usage_rest_start, #vehicle_usage_rest_stop, #vehicle_usage_rest_duration, #vehicle_usage_service_time_start, #vehicle_usage_service_time_end').timeEntry({
    show24Hours: true,
    spinnerImage: ''
  });

  $('#vehicle_usage_vehicle_color').simplecolorpicker({
    theme: 'fontawesome'
  });

  /* API: Devices */
  devices_observe_vehicle(params);
}

Paloma.controller('VehicleUsage').prototype.new = function() {
  vehicle_usages_form(this.params);
};

Paloma.controller('VehicleUsage').prototype.create = function() {
  vehicle_usages_form(this.params);
};

Paloma.controller('VehicleUsage').prototype.edit = function() {
  vehicle_usages_form(this.params);
};

Paloma.controller('VehicleUsage').prototype.update = function() {
  vehicle_usages_form(this.params);
};
