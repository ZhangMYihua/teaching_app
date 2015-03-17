class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :country_of_origin
      t.string :first_language
      t.string :subject_to_teach
      t.string :education
      t.integer :teacher_id
  		t.money :price
      t.text :about

      t.timestamps null: false
    end
  end
end
