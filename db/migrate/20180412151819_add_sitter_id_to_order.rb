class AddSitterIdToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :sitter_id, :integer
  end
end
