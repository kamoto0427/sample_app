class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(amount: @item.price, card: params['payjp-token'], currency: 'jpy')
  end

  private
  def item_params
    params.require(:item).permit(:name, :price).merge(user_id: current_user.id)
  end
end
