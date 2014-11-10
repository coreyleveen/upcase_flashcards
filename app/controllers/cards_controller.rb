class CardsController < ApplicationController
  def show
    @deck = find_deck
    @card = @deck.cards.find(params[:id])
  end

  def new
    @deck = find_deck
    @card = @deck.cards.new
  end

  def create
    @deck = find_deck
    @card = @deck.cards.new(card_params)
    @card.save
    redirect_to @deck
  end

  def edit
    @deck = find_deck
    @card = @deck.cards.find(params[:id])
  end

  def update
    @deck = find_deck
    @card = @deck.cards.find(params[:id])
    @card.update_attributes(card_params)
    redirect_to deck_card_path(@deck, @card)
  end

  def destroy
    @deck = find_deck
    @card = @deck.cards.find(params[:id])
    @card.destroy
    redirect_to @deck
  end

  private

  def find_deck
    Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
