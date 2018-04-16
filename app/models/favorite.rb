class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :sitter
  validates_uniqueness_of :user, :scope => [:sitter]
end
