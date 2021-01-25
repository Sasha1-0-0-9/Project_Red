class RemoveOrdersFromCategories < ActiveRecord::Migration[6.1]
  def change
  	remove_column :categories, :order
  end
end
