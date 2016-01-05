Rails.application.routes.draw do
  get '/change_locale/:locale', to: 'application#change_locale', as: :change_locale

  devise_for :users

  resources :comments, only: [:index, :create, :update]
  resources :evaluations, only: [:create, :update]
  resources :news
  resources :users, only: [:index] do
    member do
      get :home
      post :ban
      post :set_admin
    end
  end
  resources :videos

  root 'users#index'

end
