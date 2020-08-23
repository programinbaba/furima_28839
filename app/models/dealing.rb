class Dealing < ApplicationRecord
  belongs_to :item
  belongs_to :sold_out
end
