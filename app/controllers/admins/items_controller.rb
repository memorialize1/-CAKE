class Admins::ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sale_status)
  end
end
