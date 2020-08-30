require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # @をつけてUserのインスタンス生成
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      # 全てとは、nickname,email,password,password_confirmation,family_name,
      # first_name,family_name_katakana,first_name,katakana,birthdayのこと
      it '全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    # 実装の条件を満たせていれば良い(エラー文がきちんと出ていればもうそのエラー文についてのテストコードはいらない)
    context '新規登録できないとき' do
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'famly_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'family_name_katakanaが空だと登録できない' do
        @user.family_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カタカナ)を入力してください")
      end

      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カタカナ)を入力してください')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

      it 'emailが一意性でない(重複している)と登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailが@を含んでいないと登録できない(厳密に言うと@の前後に文字列がないといけない)' do
        @user.email = 'a.com'
        @user.valid?
        # 厳密には、エラーメッセージは出てこずに、ポップアップでエラーメッセージが表示される
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordは確認用を含めて2回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        # 厳密には、以下のエラーメッセージは出てこない
        expect(@user.errors.full_messages).to include("パスワード(確認用)とパスワードの入力が一致しません")
      end
    end
  end
end
