class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_dates = @order.order_dates.all
  end


  def order_status_update
    order = Order.find(params[:id])
    order.update(order_params)
    # OrderModel after_update => 製作ステータスの自動変更
    redirect_to admins_order_path(order)
  end

  def item_status_update
    order_date = OrderDate.find(params[:id])
    order_date.update(order_date_params)
    # OrderDetailModel after_update => 注文ステータスの自動更新
    redirect_to admins_order_path(order_date.order_id)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_date_params
    params.require(:order_date).permit(:item_status)
  end
end
