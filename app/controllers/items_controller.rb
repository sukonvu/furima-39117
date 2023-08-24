class ItemsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]
before_action :set_items, only: [:show, :edit, :destroy]

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
  end

  def edit
    redirect_to root_path unless (current_user.id == @item.user_id) && @item.order.present?
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :description, :condition_id, :category_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end
end