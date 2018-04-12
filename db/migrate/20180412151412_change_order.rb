class ChangeOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :sitter_sku
  end
end
