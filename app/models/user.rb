class User < ApplicationRecord
  has_many :subscriptions
  has_many :payments, through: :subscriptions
  has_many :credit_cards

  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end
end
