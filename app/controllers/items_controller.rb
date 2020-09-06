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
# 購入機能
  def buy
    @card = Creditcard.where(user_id: current_user.id).first
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@card.customer_id),
      currency: 'jpy'
    )
    redirect_to action: 'bought'
  end
  
  def confirm
    @item_buyer = Item.find(params[:id])
    @item_buyer.update(buyer_id: current_user.id)
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
