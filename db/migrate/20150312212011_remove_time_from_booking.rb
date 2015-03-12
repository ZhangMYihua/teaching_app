class RemoveTimeFromBooking < ActiveRecord::Migration
  def change
  	remove_column :bookings, :time
  end
end
