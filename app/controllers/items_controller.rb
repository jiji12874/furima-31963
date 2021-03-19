class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

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
    @item = Item.find(params[:id])
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  # end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if  current_user.id == @item.user_id
        @item.update(item_params)
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
end
