Rails.application.routes.draw do

  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
