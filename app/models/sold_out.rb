class SoldOut < ApplicationRecord
  belongs_to :item
  belongs_to :dealing
end
