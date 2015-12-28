Rails.application.routes.draw do
  resources :users, only: [:index] do
    member do
      post :ban
      post :set_admin
    end
  end
  root 'users#index'

  devise_for :users
end
