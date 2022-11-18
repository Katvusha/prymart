class AddForeignKeyBetweenSubcategoriesAndCategories < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :subcategories, :categories
  end
end
