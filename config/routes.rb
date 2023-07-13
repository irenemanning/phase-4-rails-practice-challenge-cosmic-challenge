Rails.application.routes.draw do
  resources :missions, only: :create
  resources :planets, only: [:index, :show, :create, :destroy, :update]
  # resources :planets, only: :index
  resources :scientists, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
