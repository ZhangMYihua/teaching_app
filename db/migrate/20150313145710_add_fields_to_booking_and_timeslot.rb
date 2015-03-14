class AddFieldsToBookingAndTimeslot < ActiveRecord::Migration
  def change
  	remove_column :timeslots, :time
  	add_column :timeslots, :start_time, :datetime
  	add_column :timeslots, :end_time, :datetime
  end
end
