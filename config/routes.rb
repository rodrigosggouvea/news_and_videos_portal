Rails.application.routes.draw do
  get '/change_locale/:locale', to: 'application#change_locale', as: :change_locale
  get '/search', to: 'application#search', as: :search

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :comments, only: [:index, :create, :update]
  resources :evaluations, only: [:create, :update]
  resources :news
  resources :users, only: [:index] do
    member do
      get :home
      post :ban
      post :set_admin
      post :friend
      post :unfriend
    end
  end
  resources :videos

  root 'videos#index'

end
