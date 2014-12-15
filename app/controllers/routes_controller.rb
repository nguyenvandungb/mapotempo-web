# Copyright © Mapotempo, 2013-2014
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
require 'tomtom'
require 'csv'

class RoutesController < ApplicationController
  load_and_authorize_resource
  before_action :set_route, only: [:update]

  def show
    respond_to do |format|
      format.html
      format.gpx do
        response.headers['Content-Disposition'] = 'attachment; filename="'+(@route.planning.name+' - '+@route.vehicle.name).gsub('"','')+'.gpx"'
      end
      format.excel do
        data = render_to_string
        send_data data.encode('ISO-8859-1'),
          type: 'text/csv',
          filename: (@route.planning.name+' - '+@route.vehicle.name).gsub('"','')+'.csv'
      end
      format.csv do
        response.headers['Content-Disposition'] = 'attachment; filename="'+(@route.planning.name+' - '+@route.vehicle.name).gsub('"','')+'.csv"'
      end
      format.tomtom do
        begin
          if params[:type] == 'waypoints'
            Tomtom.export_route_as_waypoints(@route)
          else
            Tomtom.export_route_as_orders(@route)
          end
          head :no_content
        rescue StandardError => e
          render json: e.message, status: :unprocessable_entity
        end
      end
      format.masternaut do
        begin
          Masternaut.export_route(@route)
          head :no_content
        rescue StandardError => e
          render json: e.message, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: t('activerecord.successful.messages.updated', model: @route.class.model_name.human) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:hidden, :locked, :ref)
    end
end
