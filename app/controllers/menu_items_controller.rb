class MenuItemsController < ApplicationController
  before_action :authenticate_cafe
  before_action :find_menu_item, :find_cafe, except: [:create]
  before_action :authorize_cafe, only: [:update, :destroy]

  def create
    cafe = Cafe.find_by(id: params[:cafe_id])
    menu_item = cafe.menu_items.build(menu_item_params)
    if !menu_item.save
      flash[:error] = menu_item.errors.full_messages
    end
    redirect_to cafe_path(cafe)
  end

  def update
    if !@menu_item.update_attributes(menu_item_params)
      flash[:error] = @menu_item.errors.full_messages
    end
    redirect_to cafe_path(@cafe)
  end

  def destroy
    @menu_item.destroy
    redirect_to cafe_path(@cafe)
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end

  def find_menu_item
    @menu_item = MenuItem.find_by(id: params[:id])
  end

  def find_cafe
    @cafe = @menu_item.cafe
  end

  def authenticate_cafe
    if !current_cafe
      flash[:error] = "You must be logged in to do that!"
      redirect_to cafe_path(@cafe)
    end
  end

  def authorize_cafe
    if current_cafe!=@menu_item.cafe
      flash[:error] = "You must be #{@menu_item.cafe.name} to do that!"
      redirect_to cafe_path(@cafe)
    end
  end
end


