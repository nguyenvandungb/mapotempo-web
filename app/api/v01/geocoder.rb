# Copyright © Mapotempo, 2014-2015
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
require 'geocode'

class V01::Geocoder < Grape::API
  helpers do
    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      p = ActionController::Parameters.new(params)
      p = p[:destination] if p.key?(:destination)
      p.permit(:q, :json_callback)
    end
  end

  resource :geocoder do
    desc 'Geocode.', {
      nickname: 'geocode'
    }
    params {
      requires :q, type: String, desc: 'Free query string.'
    }
    get 'search' do
      json = Geocode.code_free(params[:q]).collect{ |result|
        {
          address: {
            city: result[:free]
          },
          boundingbox: [
            result[:lat],
            result[:lat],
            result[:lng],
            result[:lng]
          ],
          display_name: result[:free],
          importance: result[:accuracy],
          lat: result[:lat],
          lon: result[:lng],
        }
      }

      if params[:json_callback]
        content_type 'text/plain'
        "#{params[:json_callback]}(#{json.to_json})"
      else
        json
      end
    end
  end
end
