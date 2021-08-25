class ItemsController < ApplicationController

  def index
  	@items = Item.all.page(params[:page]).per(8)
  	@genres = Genre.all
    # ジャンルの表示
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new


    @genres = Genre.all
    # ジャンルの表示
  end
end
