class Child < ApplicationRecord
  belongs_to :user
  validates :gender, presence: true
  validates :age, presence: true
end
