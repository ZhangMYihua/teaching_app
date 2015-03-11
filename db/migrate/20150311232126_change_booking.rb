class ChangeBooking < ActiveRecord::Migration
  def change
  	remove_column :bookings, :class_id
  	add_column :bookings, :teaching_id, :integer
  end
end
