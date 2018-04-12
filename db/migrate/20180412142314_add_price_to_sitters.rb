class AddPriceToSitters < ActiveRecord::Migration[5.1]
  def change
    add_monetize :sitters, :price, currency: { present: false }
  end
end
