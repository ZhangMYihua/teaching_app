class ChangesToUser < ActiveRecord::Migration
  def change
    remove_column :bookings, :teaching_id
  	add_column :bookings, :timeslot_id, :integer
  end
end
