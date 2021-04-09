class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create, :edit]
  before_action :authenticate_user!
  before_action :url_refuse, only: [:index,:create]
  before_action :soldout_refuse, only: [:index, :edit]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def edit

  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal, :city, :prefecture_id, :addresses, :phone_number, :building_name, :token)
                                     .merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def url_refuse
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def soldout_refuse
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end