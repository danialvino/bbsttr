class AddBookingRefToReviewsparents < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviewsparents, :booking, foreign_key: true
  end
end
