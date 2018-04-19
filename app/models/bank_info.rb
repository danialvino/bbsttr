class BankInfo < ApplicationRecord
  belongs_to :sitter
  # validations
  validates :agency, presence: true
  validates :account, presence: true
  validates :bank, presence: true
  validates :cpf, presence: true
end
