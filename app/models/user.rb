class User < ApplicationRecord
  has_many :subscriptions
  has_many :payments, through: :subscriptions
  has_many :credit_cards
  
  has_secure_password
end
