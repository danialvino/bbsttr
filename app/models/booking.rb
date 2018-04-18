class Booking < ApplicationRecord
  belongs_to :sitter
  belongs_to :user
  after_create :send_booked_email

   def send_booked_email
    UserMailer.booked(self).deliver_later
  end
end
