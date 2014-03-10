class WeightsController < ApplicationController

  before_action :authenticate_user!

  def index
    @weights=Weight.where(user_id: current_user.id).sorted
  end

  def show
    @weight=Weight.find(params[:id])
  end

  def new
    @weight=Weight.new
    @weight.date=Time.now
  end

  def create
    @weight = Weight.new(weight_params)

    if @weight.save
        current_user.weights << @weight 
        flash[:notice] = "You have successfully added a new weight."
        redirect_to weights_path
    else
      render new_weight_path
    end

  end

  def edit
    @weight=Weight.find(params[:id])
  end

  def update
    @weight=Weight.find(params[:id])

    if @weight.update_attributes(weight_params)
        flash[:notice] = "You have successfully updated the information."
        redirect_to weights_path #weight_path(@weight)
    else
      render edit_weight_path @weight 
    end

  end

  def destroy
    weight=Weight.find(params[:id])

    weight.destroy
    flash[:notice] = "You have successfully deleted a record."
    redirect_to weights_path
  end

  private

  def weight_params
    params.require(:weight).permit(:date,:weight,:fat_porcentage)
  end

end
