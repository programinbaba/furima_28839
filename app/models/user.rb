class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :sold_outs

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_katakana
    validates :first_name_katakana
    validates :birthday
  end

  # passwordの英数字混合の判断
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "は英字と数字の両方を含めて設定してください"

  # 全角かな/カナ漢字の区別
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options format: { with: NAME_REGEX, message: "は全角文字を使用してください" } do
    validates :family_name
    validates :first_name
  end

  # カタカナのみに設定
  with_options format: { with: /\A[ァ-ン]+\z/, message: "はカタカナのみ使用してください" } do
    validates :family_name_katakana
    validates :first_name_katakana
  end

  # config/initializers/devise.rbに記述があるため、書かなくても良いが、エラーメッセージを表示させるため記述
  with_options length: { minimum: 6 } do
    validates :password
  end
end
