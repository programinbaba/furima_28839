require 'rails_helper'

RSpec.describe UserDealing, type: :model do
  describe '購入情報の保存' do
    before do
      @user_dealing = FactoryBot.build(:user_dealing)
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@user_dealing).to be_valid
    end

    it 'クレジットカード情報が一つでもないと保存できない' do
      @user_dealing.token = nil
      @user_dealing.valid?
      # 購入ボタンを押すと、フリーズする(更新すれば直る)
    end

    it '郵便番号がないと保存できない' do
      @user_dealing.postal_code = nil
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県がないと保存できない' do
      @user_dealing.prefecture_id = 1
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '市区町村がないと保存できない' do
      @user_dealing.city = nil
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include("City can't be blank")
    end

    it '番地がないと保存できない' do
      @user_dealing.house_num = nil
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include("House num can't be blank")
    end

    it '電話番号がないと保存できない' do
      @user_dealing.phone = nil
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include("Phone can't be blank")
    end

    it '郵便番号にハイフンがないと保存できない' do
      @user_dealing.postal_code = '1111111'
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include('Postal code is invalid')
    end

    it '電話番号にハイフンは不要で、11桁でないと保存できない' do
      @user_dealing.phone = '111-1111-11111'
      @user_dealing.valid?
      expect(@user_dealing.errors.full_messages).to include('Phone is invalid')
    end
  end
end
