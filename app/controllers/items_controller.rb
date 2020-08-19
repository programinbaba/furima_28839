class ItemsController < ApplicationController
  def index
    
  end
  
  def new
    
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(
      :image, :name, :text, :category_id, :status_id, :cost_id, :prefecture_id, :day_id, :price
    ).merge(user_id: current_user.id)
  end
end
