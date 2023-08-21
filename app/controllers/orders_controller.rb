class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
    def order_params
       params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_num, :building_name, :phone).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end
