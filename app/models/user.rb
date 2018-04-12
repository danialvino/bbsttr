class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :sitter
  has_many :bookings
  has_many :children

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def sitter?
    if self.sitter.nil?
      return false
    else
      return self.sitter.user_id == self.id
    end
  end



end
