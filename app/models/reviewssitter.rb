class Reviewssitter < ApplicationRecord
  belongs_to :user
  belongs_to :sitter
  belongs_to :booking
  validates :booking_id, uniqueness: true
  validates :rating, presence: true
end
