class Dealing < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :sold_out

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :phone
  end
end
