require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # @を付けてItemのインスタンスを生成
    # fixture_file_uploadは、引数に画像のパスを指定することで、
    # 指定された画像のアップロードをテストできる状態にするメソッド
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      # 全てとは、image,name,text,categoty,
      # status,cost,prefecture,day,priceのこと
      it '全てあれば出品される' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名がないと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明がないと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it '商品の状態についての情報がないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it '配送料の負担についての情報がないと出品できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it '発送元の地域についての情報がないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送元の地域を選択してください')
      end

      it '発送までの日数についての情報がないと出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end

      it '価格についての情報がないと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '価格が299円では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it '価格が10000000円では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は10000000より小さい値にしてください')
      end
    end
  end
end
