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

  def borough
    @cafe = Cafe.find_by(id: params[:cafe_id])
    @cafes = @cafe.filter_by_borough
    render :index
  end

  def neighborhood
    @cafe = Cafe.find_by(id: params[:cafe_id])
    @cafes = @cafe.filter_by_neighborhood
    render :index
  end

  def update
    @cafe = current_cafe
    if params[:cafe]
      @cafe.update_attributes(params[:cafe])
    else
      flash[:error] = ["Something Went Wrong! Your Picture Was Not Uploaded"]
    end
    render :show
  end

end



