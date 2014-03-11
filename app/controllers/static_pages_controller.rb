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
  end

  def graph
  end
end
