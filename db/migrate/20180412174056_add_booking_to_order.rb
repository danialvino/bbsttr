class AddBookingToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :booking, foreign_key: true
  end
end
