class Admins::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to admins_items_path
    else
       redirect_to new_admins_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sale_status)
  end
end
