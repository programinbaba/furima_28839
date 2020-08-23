class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # この処理はコンマを使ってまとめられない(公式で決まっているそう)
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  belongs_to :user
  has_one_attached :image
  has_one :sold_out
  has_one :dealing

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    # validates :price  numericaliryで定義されているので不要
    validates :user
  end

  # ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :day_id
  end

  # 数字のみ(整数)で構成され(numericarilyはデフォルトでは小数点も許容するらしい)
  # 300以上9,999,999(999万)より小さいか判別
  # numericalityは空を許可しないため、上のpresence: trueは不要
  validates :price, numericality: {
    only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000
  }
end
