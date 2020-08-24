class SoldOut < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :dealing
end
