Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'

  resources :cards, only: %i[index new create]
end
