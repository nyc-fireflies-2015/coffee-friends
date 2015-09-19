class CafesController < ApplicationController

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find_by(id: params[:id])
    @cafe = current_cafe unless @cafe
    @menu_item = MenuItem.new
    @menu_items = @cafe.menu_items
  end
end
