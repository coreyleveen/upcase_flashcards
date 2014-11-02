class Deck < ActiveRecord::Base
  def create
    Deck.create(deck_params)
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
