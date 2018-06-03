Rails.application.routes.draw do

  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users
  devise_scope :user do
    get 'downgrade' => 'users#downgrade'
  end

  get 'welcome/index'
  get 'users/show'

  root 'welcome#index'
end
