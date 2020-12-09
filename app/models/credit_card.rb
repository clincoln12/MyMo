class CreditCard < ApplicationRecord
  has_many :payments
  has_many :subscriptions, through: :payments
  belongs_to :user

  validates_length_of :digits, minimum: 4, maximum: 4
end
