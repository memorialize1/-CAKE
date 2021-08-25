class Admins::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to admins_items_path
    else
       flash[:item_error] = "商品情報が正常に保存されませんでした。"
       redirect_to new_admins_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      flash[:item_error] = "商品情報が正常に保存されませんでした。"
      render :edit
    end
  end



  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sale_status)
  end
end
