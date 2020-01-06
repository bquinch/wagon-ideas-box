Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: :show

  resources :ideas do
    resources :comments, only: %i[new create]
    resources :upvotes, only: %i[create]
    resources :favorites, only: %i[create]
    resources :participants
  end

  resources :favorites, only: %i[destroy]
  resources :comments, only: %i[destroy]
  resources :upvotes, only: %i[destroy]
  get 'components', to: 'pages#components'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
