class ItemsController < ApplicationController
  
  def index
    @cakes = Item.where(sale_status: "販売可").page(params[:page]).per(12)
    
  end
  
  
end
