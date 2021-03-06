class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]
  has_one :sitter, dependent: :destroy
  has_one :bank_info, through: :sitter, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  # relations
  has_many :bookings
  has_many :children
  has_many :orders
  has_many :reviewssitters
  has_many :reviewsparents
  # validations!
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email)
    user_params[:name] = auth.info.name
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save(validate: false)
    end

    return user
  end

  def sitter?
    if self.sitter.nil?
      return false
    else
      return false if self.sitter.id.nil?
    end
    true
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end


end
