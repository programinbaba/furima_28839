class DealingsController < ApplicationController
  before_action :move_to_login
  before_action :item_id_params
  before_action :move_to_toppage
  before_action :move_to_top_page
  def index
  end

  def create
    # 保存に失敗した時、@itemを定義していないとエラーが生じる
    # :token以外をデータベースに保存
    @dealing = UserDealing.new(dealing_params)

    if @dealing.valid?
      pay_item

      @dealing.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end

  def dealing_params
    params.permit(:postal_code, :prefecture_id, :city, :house_num, :building, :phone, :item_id).merge(user_id: current_user.id)
  end

  def item_id_params
    # カラムがitem_idなのは、ルーティングのネストで
    @item = Item.find(params[:item_id])
  end

  # 出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移
  def move_to_toppage
    redirect_to root_path if current_user.id == @item.user_id
  end

  # URLを直接入力し、購入済み商品の購入ページへ遷移しようとすると、トップページに遷移
  def move_to_top_page
    # もし購入済みの商品があればルートパスへ(アソシエーションでつながっているからできる記述)
    redirect_to root_path if @item.sold_out
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,          # 商品の価格
      card: params[:token],         # カードトークン
      currency: 'jpy'               # 通貨の種類(日本円)
    )
  end
end
