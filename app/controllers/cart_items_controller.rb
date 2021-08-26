class CartItemsController < ApplicationController
  
  before_action :authenticate_customer!

  def index
    null = Cart.where(current_customer_id: params[:id])
    @cart_items = null.all
    @total_price = calculate(null)
  end

  def create
    @cart_item = Cart.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @validate_into_cart = @cart_item.validate_into_cart
    if @validate_into_cart == false
      flash[:into_cart_error] = "個数が選択されていないか、すでにカートに追加されているアイテムです。"
      redirect_to item_path(params[:cart_item][:item_id])
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = Cart.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = Cart.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.carts.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart).permit(:customer_id, :item_id, :quantity)
  end

  def calculate(user)
    total_price = 0
    carts.each do |cart_item|
      total_price += cart_item.quantity * cart_item.item.price
    end
    return (total_price * 1.1).floor
  end

end
