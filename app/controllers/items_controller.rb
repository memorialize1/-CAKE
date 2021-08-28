class ItemsController < ApplicationController

  def index
  	@items = Item.where(sale_status: "販売中").page(params[:page]).per(8)
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new


    @genres = Genre.all
    # ジャンルの表示
  end

end
