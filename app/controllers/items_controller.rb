class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def index
  	@items = Item.all.page(params[:page]).per(8)
  	@genres = Genre.all
    # ジャンルの表示
  end

  def show
  	@item = Item.find(params[:id])
  	@cart = Cart.new
    @user = current_user

    @genres = Genre.all
    # ジャンルの表示
  end
  
  def search
   @items = Item.search(params[:keyword])
   @keyword = params[:keyword]
   render "index"
  end

end
