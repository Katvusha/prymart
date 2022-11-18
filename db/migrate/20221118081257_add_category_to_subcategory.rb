class AddCategoryToSubcategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :subcategories, :category, index: true
  end
end
