Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: :show
  resources :ideas do
    resources :comments, only: %i[new create]
  end

  resources :comments, only: %i[destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
