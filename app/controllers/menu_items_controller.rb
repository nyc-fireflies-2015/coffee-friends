class MenuItemsController < ApplicationController
  before_action :find_menu_item, :authenticate_cafe
  before_action :authorize_cafe, {except: :create}

  def create
    cafe = current_cafe
    menu_item = cafe.menu_items.build(menu_item_params)
    if !menu_item.save
      flash[:error] = menu_item.errors.full_messages
    end
    redirect_to cafe_path(cafe)
  end

  def update
    @cafe = @menu_item.cafe
    if !@menu_item.update_attributes(menu_item_params)
      flash[:error] = @menu_item.errors.full_messages
    end
    redirect_to cafe_path(@cafe)
  end

  def destroy
    @cafe = @menu_item.cafe
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

  def authenticate_cafe
    redirect_to root_path unless current_cafe
  end

  def authorize_cafe
    redirect_to root_path unless current_cafe.owns_item?(@menu_item)
  end
end


