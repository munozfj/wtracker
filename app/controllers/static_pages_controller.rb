class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:panel, :graph]

  def home
  end

  def contact
  end

  def about
  end

  def help
  end

  def panel
    if current_user.profile.blank?
        profile=Profile.new
        profile.save
        current_user.profile=profile
    end
  end

  def graph
    @weight_max=current_user.weights.maximum("weight")
    @weight_min=current_user.weights.minimum("weight")
    @weight_max+=0.1
    @weight_min-=0.1

    #fat%
    @fat_max=current_user.weights.maximum("fat_porcentage")
    @fat_min=current_user.weights.minimum("fat_porcentage")
    @fat_max+=0.1
    @fat_min-=0.1
    #puts @fat_max
    #puts @fat_min
  end
end
