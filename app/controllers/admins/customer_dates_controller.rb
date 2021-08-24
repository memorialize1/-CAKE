class Admins::CustomerDatesController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def customer_params
    params.require(:customer).permit(:l_name, :f_name, :l_kana, :f_kana, :post_code, :address, :phone_number, :email, :user_status)
  end

end
