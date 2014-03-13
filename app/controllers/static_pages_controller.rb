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
  end
end
