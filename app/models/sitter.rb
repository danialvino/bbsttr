class Sitter < ApplicationRecord
  belongs_to :user
  serialize :skills, Array
  has_many :availables
  validates :pay_rate, presence: true
  validates :user_id, uniqueness: true
end
