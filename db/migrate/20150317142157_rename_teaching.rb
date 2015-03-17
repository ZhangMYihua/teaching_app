class RenameTeaching < ActiveRecord::Migration
  def change
  	rename_table :teachings, :instructor
  end
end
