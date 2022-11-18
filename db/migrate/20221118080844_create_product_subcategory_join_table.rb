class CreateProductSubcategoryJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :subcategories, :products
  end
end
