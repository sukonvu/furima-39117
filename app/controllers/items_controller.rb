class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
       return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   if @item.update(item_params)
  #     redirect_to item_path(@item)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :description, :condition_id, :category_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end
end