class OrdersController < ApplicationController
  
  def index
    @orders = Order.where(customer_id:current_customer)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def new
  end
  
  def confirm
  end
  
end
