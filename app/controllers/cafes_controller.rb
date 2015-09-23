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
    # if request.xhr?
      @cafe = Cafe.find_by_slug(params[:id])
    # else
      # @cafe = Cafe.find_by(id:params[:id])
    # end
    @cafe = current_cafe unless @cafe
    @menu_item = MenuItem.new
    @menu_items = @cafe.menu_items
    @charitable_gifts = @cafe.unredeemed_charitable_gifts
    @unredeemed_coffee_gifts = @cafe.unredeemed_coffee_gifts
    if request.xhr?
      @unredeemed_coffee_gifts = @cafe.search(params[:search]).order("created_at DESC")
      render :partial => "unredeemed_coffee_gift", collection: @unredeemed_coffee_gifts
    end
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



