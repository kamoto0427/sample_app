class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :explain,
      :price,
      image_attributes: {image: []}
    ).merge(seller_id: current_user.id)
  end
end
