class AddColumnToTeachings < ActiveRecord::Migration
  def change
  	add_column :teachings, :about, :text
  end
end
