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

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :cost
    validates :prefecture
    validates :day
    validates :price
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
end
