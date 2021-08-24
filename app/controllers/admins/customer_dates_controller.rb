class Admins::CustomerDatesController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_dates_path
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:l_name, :f_name, :l_kana, :f_kana, :post_code, :address, :phone_number, :email, :user_status)
  end

end
