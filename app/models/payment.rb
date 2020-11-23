class Payment < ApplicationRecord
  belongs_to :subscription
  belongs_to :credit_card
end
