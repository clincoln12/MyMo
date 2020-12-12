class Subscription < ApplicationRecord
  belongs_to :user
  has_many :payments, :dependent => :destroy

  def self.alphabetical
    self.order(:name)
  end

  def self.price
    self.order(fee: :desc)
  end
end
