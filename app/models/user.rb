class User < ApplicationRecord
  has_many :subscriptions
  has_many :services, through: :subscriptions
  
  has_secure_password
end
