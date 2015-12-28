Rails.application.routes.draw do
  get '/change_locale/:locale', to: 'application#change_locale', as: :change_locale
  resources :users, only: [:index] do
    member do
      post :ban
      post :set_admin
    end
  end
  root 'users#index'

  devise_for :users
end
