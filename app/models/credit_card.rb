class CreditCard < ApplicationRecord
  has_many :payments
  has_many :subscriptions, through: :payments
  belongs_to :user
end
