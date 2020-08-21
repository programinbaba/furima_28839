require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # @を付けてItemのインスタンスを生成
    # fixture_file_uploadは、引数に画像のパスを指定することで、
    # 指定された画像のアップロードをテストできる状態にするメソッド
    @item.image = fixture_file_upload("public/images/test_image.png")
  end

  describe "商品出品" do
    context "商品出品ができる場合" do
      # 全てとは、image,name,text,categoty,
      # status,cost,prefecture,day,priceのこと
      it "全てあれば出品される" do
        
      end
    end

    context "商品出品ができない場合" do
      it "画像がないと出品できない" do
        
      end

      it "商品名がないと出品できない" do
        
      end

      it "商品の説明がないと出品できない" do
        
      end

      it "カテゴリーの情報がないと出品できない" do
        
      end

      it "商品の状態についての情報がないと出品できない" do
        
      end

      it "配送料の負担についての情報がないと出品できない" do
        
      end

      it "発送元の地域についての情報がないと出品できない" do
        
      end

      it "発送までの日数についての情報がないと出品できない" do
        
      end

      it "価格についての情報がないと出品できない" do
        
      end
    end
  end
end
