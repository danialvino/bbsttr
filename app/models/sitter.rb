class Sitter < ApplicationRecord
  belongs_to :user
  serialize :skills, Array
  has_many :availables
  has_many :bookings
  has_many :reviewssitters
  has_many :reviewsparents
  has_one :bank_info
  accepts_nested_attributes_for :bank_info
  validates :price, presence: true
  validates :user_id, uniqueness: true
  monetize :price_cents
end
