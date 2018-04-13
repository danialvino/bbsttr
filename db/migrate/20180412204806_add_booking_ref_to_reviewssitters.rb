class AddBookingRefToReviewssitters < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviewssitters, :booking, foreign_key: true
  end
end
