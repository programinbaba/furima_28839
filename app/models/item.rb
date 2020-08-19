class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  before_to_active_hash :category, :status, :cost, :prefecture, :day

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
