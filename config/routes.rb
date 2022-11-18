Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'static_pages#home'
  resources :users do 
    resources :posts , only: [:create] do 
      resources :comments , only: [:create]
      resources :likes , only: [:create]
    end
  end

  resources :posts
  resources :likes , only: [:destroy]
  resources :comments
end
