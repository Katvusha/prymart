class SwapCategoryStringWithReference < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :category, :string
    add_reference :products, :category, index: true
  end
end
