class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :text, :category_id, :status_id, :cost_id, :prefecture_id, :day_id, :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end
