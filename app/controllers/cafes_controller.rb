class CafesController < ApplicationController

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find_by(id: params[:id])
  end
end
