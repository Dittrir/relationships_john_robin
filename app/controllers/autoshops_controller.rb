class AutoshopsController < ApplicationController
  def index
    @auto_shops = Autoshop.all
  end
end
