class DealingsController < ApplicationController
  before_action :move_to_login
  def index
    # カラムがitem_idなのは、ルーティングのネストで
    @item = Item.find(params[:item_id])
  end

  def create
    
  end

  private
  def move_to_login
    redirect_to user_session_path unless user_signed_in?
  end
end
