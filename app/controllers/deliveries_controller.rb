class DeliveriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @delivery = Delivery.new
    # フォームを表示するためにdelivery_paramsを与えないDerivery.newを代入。
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user_id = current_user.id
    # 親モデルであるUserのidと紐づいているため、Deriveryを保存する前にそれを保存。
    if @delivery.save
      redirect_back(fallback_location: root_path)
    else
      @user = User.find(params[:user_id])
      # renderはredirect_toと違い、elseの中でviewを作るため、@userを代入し直す。
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
    redirect_to user_deliveries_path
    else
      render :edit
    end
  end

end

private
def delivery_params
    params.require(:delivery).permit(:postal_code,
                                       :address,
                                       :name)
end