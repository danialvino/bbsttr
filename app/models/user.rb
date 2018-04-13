class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :sitter
  has_many :bookings
  has_many :children
  has_many :orders
  has_many :reviewssitters
  has_many :reviewsparents

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
