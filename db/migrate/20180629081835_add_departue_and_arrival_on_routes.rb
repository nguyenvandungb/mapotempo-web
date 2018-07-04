class AddDepartueAndArrivalOnRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :departure_eta, :time, nil: true
    add_column :routes, :departure_status, :string, nil: true

    add_column :routes, :arrival_eta, :time, nil: true
    add_column :routes, :arrival_status, :string, nil: true
  end
end
