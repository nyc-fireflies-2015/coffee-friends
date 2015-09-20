class CafesController < ApplicationController

  def index
    @q = Cafe.ransack(params[:q])
    @cafes = @q.result(distinct: true)
  end

  def show
    @cafe = Cafe.find_by(id: params[:id])
    @cafe = current_cafe unless @cafe
    @menu_item = MenuItem.new
    @menu_items = @cafe.menu_items
  end
end
