class Sitter < ApplicationRecord
  belongs_to :user
  serialize :skills, Array
  validates :pay_rate, presence: true
end
