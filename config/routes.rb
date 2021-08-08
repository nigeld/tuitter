Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweets 
  resources :followings, only: [:new, :create, :destroy]

  root 'dashboard#index'

  get '/follow', to: 'followings#follow', as: 'follow_username_form'
  post '/follow', to: 'followings#new', as: 'follow_username'

  get '/:username', to: 'users#show', as: 'user_profile'
  get '/:username/followers', to: 'users#followers', as: 'user_followers'
  get '/:username/followed', to: 'users#followed', as: 'user_followees'
  
end
