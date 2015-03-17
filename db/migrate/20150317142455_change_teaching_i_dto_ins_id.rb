class ChangeTeachingIDtoInsId < ActiveRecord::Migration
  def change
  	rename_column :timeslots, :teaching_id, :instructor_id
  end
end
