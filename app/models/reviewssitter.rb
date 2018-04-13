class Reviewssitter < ApplicationRecord
  belongs_to :user
  belongs_to :sitter
  belongs_to :booking
end
