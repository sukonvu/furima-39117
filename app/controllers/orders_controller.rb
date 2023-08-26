class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_orders, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_orders
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif @item.order.present? || current_user.nil?
    redirect_to new_user_session_path
  end
end

    def order_params
       params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_num, :building_name, :phone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    
      currency: 'jpy'               
    )
  end
end
