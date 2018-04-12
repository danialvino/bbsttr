class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :sitters, :pay_rate, :price
  end
end
