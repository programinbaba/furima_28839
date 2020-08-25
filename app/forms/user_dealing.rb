class UserDealing

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_num
    validates :phone
  end

  # 郵便番号(「-」を含みかつ7桁)  \dは数字, {3}は3回
  with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code
  end

  # 電話番号(数字が11桁)
  with_options format: {  with: /\A\d{11}\z/ } do
    validates :phone
  end

  def save
    # モデル名(テーブル名ではない Sold_outを書くわけではない)
    SoldOut.create(
      user_id: user_id, item_id: item_id
    )
    Dealing.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_num: house_num,
      building: building,
      phone: phone,
      user_id: user_id,
      item_id: item_id
    )
  end
end