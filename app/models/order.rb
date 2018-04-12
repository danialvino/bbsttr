class Order < ApplicationRecord
  belongs_to :user
  monetize :amount_cents
end
