class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :sitter
  has_many :bookings
  has_many :children

  def sitter?
    if self.sitter.nil?
      return false
    else
      return self.sitter.user_id == self.id
    end
  end
end
