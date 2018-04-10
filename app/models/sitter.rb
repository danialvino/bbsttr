class Sitter < ApplicationRecord
  belongs_to :user
  serialize :skills, Array
  has_many :availables
  has_one :bankinfo
  accepts_nested_attributes_for :bankinfo
  validates :pay_rate, presence: true
  validates :user_id, uniqueness: true
end
