class AutoshopsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end
end
