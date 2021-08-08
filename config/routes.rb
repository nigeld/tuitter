Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweets 
  resources :followings, only: [:new, :create, :destroy]

  root 'dashboard#index'

  get '/:username', to: 'users#show'
  get '/:username/followers', to: 'users#followers'
  get '/:username/followed', to: 'users#followed'
end
