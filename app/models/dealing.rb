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

  # 郵便番号(「-」を含みかつ7桁)  \dは数字, {3}は3回
  with_options format { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code
  end

  # 電話番号(数字が11桁)
  with_options format {  with: /\A\d{11}\z/ } do
    validates :phone
  end
end
