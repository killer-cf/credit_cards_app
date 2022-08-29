Rails.application.routes.draw do
  devise_for :admins
  root to: 'home#index'

  resources :cards, only: %i[index new create]

  namespace :api do
    namespace :v1 do
      resources :transactions, only: %i[create]
    end
  end
end
