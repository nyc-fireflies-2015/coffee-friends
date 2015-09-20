class CafesController < ApplicationController
  before_action :find_cafe, {except: :index}

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = current_cafe unless @cafe
    @menu_item = MenuItem.new
    @menu_items = @cafe.menu_items
  end

  def borough
    @cafes = @cafe.filter_by_borough
    render :index
  end

  def neighborhood
    @cafes = @cafe.filter_by_neighborhood
    render :index
  end

  private

  def find_cafe
    @cafe = Cafe.find_by(id: params[:cafe_id])
  end

end



