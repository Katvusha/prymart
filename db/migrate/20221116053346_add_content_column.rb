class AddContentColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :content, :string, null: false
  end
end
