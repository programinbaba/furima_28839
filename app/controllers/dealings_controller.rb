class DealingsController < ApplicationController
  before_action :move_to_login
  def index
    # カラムがitem_idなのは、ルーティングのネストで
    @item = Item.find(params[:item_id])
  end

  def create
    # 保存に失敗した時、@itemを定義していないとエラーが生じる
    @item = Item.find(params[:item_id])
    # :token以外をデータベースに保存
    @dealing = UserDealing.new(dealing_params)
    
    if @dealing.valid?
      pay_item
      
      @dealing.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private
  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end

  def dealing_params
    params.permit(:postal_code, :prefecture_id, :city, :house_num, :building, :phone, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_220b7f3a7bf60b8e600bfc3b"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,          # 商品の価格
      card: params[:token],         # カードトークン
      currency: "jpy"               # 通貨の種類(日本円)
    )
  end
end
