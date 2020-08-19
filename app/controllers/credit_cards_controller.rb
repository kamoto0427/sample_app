class CreditCardsController < ApplicationController

  require "payjp"

  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params["payjp_token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp_token"],
        metadata: {user_id: current_user.id}
      )

      @card = Card.new(user_id: current_user.id)

      if @card.save
      else
        redirect_to action: "create"
      end
    end
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(amount: @item.price, card: params['payjp-token'], currency: 'jpy')
  end
end
