class CafesController < ApplicationController

  def index
    @cafes = Cafe.all
    if request.xhr?
      render @cafes
    else
      render :index
    end
  end

  def show
    @cafe = Cafe.find_by(id: params[:id])
    @cafe = current_cafe unless @cafe
    @menu_item = MenuItem.new
    @menu_items = @cafe.menu_items
    if params[:search]
      @unredeemed_coffee_gifts = @cafe.search(params[:search]).order("created_at DESC")
    else
      @unredeemed_coffee_gifts = @cafe.unredeemed_coffee_gifts
    end
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

  def borough
    if request.xhr?
      @cafes = Cafe.filter_by_borough(params[:tag])
      render @cafes
    else
      @cafes = Cafe.all
      render :index
    end
  end

  def neighborhood
    if request.xhr?
      @cafes = Cafe.filter_by_neighborhood(params[:tag])
      render @cafes
    else
      @cafes = Cafe.all
      render :index
    end
  end

end



