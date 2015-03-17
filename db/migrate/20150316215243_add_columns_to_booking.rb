class AddColumnsToBooking < ActiveRecord::Migration
  def change
  	add_column :bookings, :start_time, :date_time
  	add_column :bookings, :end_time, :date_time 
  end
end
