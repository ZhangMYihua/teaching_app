class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :time
      t.text :description
      t.string :student_id
      t.string :class_id

      t.timestamps null: false
    end
  end
end
