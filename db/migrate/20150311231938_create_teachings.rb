class CreateTeachings < ActiveRecord::Migration
  def change
    create_table :teachings do |t|
      t.string :country_of_origin
      t.string :first_language
      t.string :subject_to_teach
      t.string :education
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
