class Reviewsparent < ApplicationRecord
  belongs_to :user
  belongs_to :sitter
end
