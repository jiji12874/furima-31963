class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.order("updated_at DESC")
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
    
  def show
      
  end
    
  def destroy
      @item.destroy
      redirect_to root_path

  end

  def edit
    
  end

  def update
    if  @item.update(item_params)
        redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :price, :category_id, :status_id, :cost_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
      unless @item
        redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end