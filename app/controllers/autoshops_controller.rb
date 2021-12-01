class AutoshopsController < ApplicationController
  def index
    @autoshops = Autoshop.all
  end

  def show
  end
end
