Rails.application.routes.draw do
  get 'users/index'
  root 'users#index'

  devise_for :users
end
