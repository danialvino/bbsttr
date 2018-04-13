class Available < ApplicationRecord
  belongs_to :sitter
  validates :start_time, presence: true
  validates :end_time, presence: true
end
