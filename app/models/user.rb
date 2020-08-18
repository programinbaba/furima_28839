class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_katakana
    validates :first_name_katakana
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\Z/ } do
    validates :family_name
    validates :first_name
  end
  
  with_options format: { with: /\A[ァ-ン]+\Z/ } do
    validates :family_name_katakana
    validates :first_name_katakana
  end
end
