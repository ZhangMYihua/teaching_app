class AddPriceAndDescriptionToTeachings < ActiveRecord::Migration
  def change
  	add_money :teachings, :price
  end
end
