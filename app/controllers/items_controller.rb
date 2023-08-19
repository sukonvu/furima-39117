class ItemsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
before_action :set_items, only: [:show, :edit, :update, :destroy]
before_action :correct_item,only: [:edit,:destroy]

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
  end

  def update
    if @item.update(item_params)
       redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

   def correct_item
      unless @item.user.id == current_user.id
      redirect_to items_path
   end
end

  def item_params
    params.require(:item).permit(:item_image, :item_name, :description, :condition_id, :category_id, :delivery_charge_id, :prefecture_id, :shipping_date_id, :price ).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end
end