Rails.application.routes.draw do
  resources :decks do
    resources :cards, except: :index
  end
end
