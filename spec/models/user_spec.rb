require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) #@をつけてUserのインスタンス生成
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      # 全てとは、nickname,email,password,password_confirmation,family_name,
      # first_name,family_name_katakana,first_name,katakana,birthdayのこと
      it "全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "famly_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "family_name_katakanaが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_name_katakanaが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it "emailが一意性でない(重複している)と登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが@を含んでいないと登録できない(厳密に言うと@の前後に文字列がないといけない)" do
        @user.email = "a.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
    end
  end
end
