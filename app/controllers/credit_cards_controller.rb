class CreditCardsController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "show" if card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]

    if params["payjp_token"].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params["payjp-token"],
        metadata: {user_id: current_user.id}
      )

      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "create"
      end
    end
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer
      @default_card_information = customer.cards.retrieve()
    end
  end
end
