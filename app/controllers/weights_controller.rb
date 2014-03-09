class WeightsController < ApplicationController
  def index
    @weights=Weight.where(user_id: current_user.id).sorted
  end

  def show
    @weight=Weight.find(params[:id])
  end

  def new
    @weight=Weight.new
    @weight.date = Time.now
  end

  def create
    @weight = Weight.new(weight_params)

    if @weight.save
        current_user.weights << @weight 
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
        #redirect_to weights_path #weight_path(@weight)
        redirect_to controller: 'weights', action: 'show', id: @weight.id
    else
      #render edit_weight_path
      render controller: 'weights', action: 'edit'
    end

  end

  def destroy
    weight=Weight.find(params[:id])

    weight.destroy
    redirect_to weights_path
  end

  private

  def weight_params
    params.require(:weight).permit(:date,:weight,:fat_porcentage)
  end

end
