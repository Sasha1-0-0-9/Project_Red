class AddSubcategoryReference < ActiveRecord::Migration[6.1]
  def change
  	add_reference :categories, :parent
  end
end
