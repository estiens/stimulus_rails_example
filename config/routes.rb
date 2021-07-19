Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: %i[index create]
  resources :animals, only: [:index] do
    member do
      post :like
      post :dislike
      post :reset
    end
  end
end
