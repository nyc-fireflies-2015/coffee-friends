class MenuItemsController < ApplicationController
  before_action :find_menu_item, :authenticate_cafe
  before_action :authorize_cafe, {except: :create}

  def create
    cafe = current_cafe
    menu_item = cafe.menu_items.build(menu_item_params)
    menu_item.save
    redirect_to cafes_profile_path
  end

  def update
    @cafe = @menu_item.cafe
    @menu_item.update_attributes(menu_item_params)
    redirect_to cafes_profile_path
  end

  def destroy
    @cafe = @menu_item.cafe
    @menu_item.destroy
    redirect_to cafes_profile_path
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


