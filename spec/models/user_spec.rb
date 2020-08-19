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
        
      end

      it "passwordが6文字以上かつ半角英数字混合であれば登録できる" do
        
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空だと登録できない" do
        
      end

      it "emailが空だと登録できない" do
        
      end

      it "passwordが空だと登録できない" do
        
      end

      it "famly_nameが空だと登録できない" do
        
      end

      it "first_nameが空だと登録できない" do
        
      end

      it "family_name_katakanaが空だと登録できない" do
        
      end

      it "first_name_katakanaが空だと登録できない" do
        
      end

      it "birthdayが空だと登録できない" do
        
      end

      it "emailが一意性でない(重複している)と登録できない" do
        
      end

      it "emailが@を含んでいないと登録できない(厳密に言うと@の前後に文字列がないといけない)" do
        
      end

      it "passwordが5文字以下であれば登録できない" do
        
      end
      
      it "passwordが全角だと登録できない" do
        
      end

      it "passwordが半角英文字だけだと登録できない" do
        
      end

      it "passwordが半角数字だけだと登録できない" do
        
      end

      it "passwordは確認用を含めて2回入力しないと登録できない" do
        
      end

      it "family_nameが半角だと登録できない" do
        
      end

      it "family_nameが数字だと登録できない" do
        
      end

      it "first_nameが半角だと登録できない" do
        
      end

      it "first_nameが数字だと登録できない" do
        
      end

      it "family_name_katakanaが半角だと登録できない" do
        
      end

      it "family_name_katakanaが数字だと登録できない" do
        
      end

      it "family_name_katakanaが全角ひらがなだと登録できない" do
        
      end

      it "family_name_katakanaが全角漢字だと登録できない" do
        
      end

      it "first_name_katakanaが半角だと登録できない" do
        
      end

      it "first_name_katakanaが数字だと登録できない" do
        
      end

      it "first_name_katakanaが全角ひらがなだと登録できない" do
        
      end

      it "first_name_katakanaが全角漢字だと登録できない" do
        
      end
    end
  end
end
