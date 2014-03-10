class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: :panel

  def home
  end

  def contact
  end

  def about
  end

  def help
  end

  def panel
  end
end
