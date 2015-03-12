class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer :teaching_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
