class RemoveContentFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :content
  end
end
