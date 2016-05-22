Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :players
  resources :games
  resources :results do 
    collection do
      get 'sort_by_average'
      get 'sort_by_co'
      get 'sort_by_hs'
    end
  end
end
