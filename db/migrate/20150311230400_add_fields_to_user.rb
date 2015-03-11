class AddFieldsToUser < ActiveRecord::Migration
  def change
  add_column :users, :first_name, :string
  add_column :users, :last_name, :string
  add_column :users, :city_time_zone, :string
  end
end
