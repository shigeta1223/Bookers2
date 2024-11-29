Rails.application.routes.draw do
  root  'homes#top'
  get 'homes/top'
  get "home/about" => "homes#about", as:'about'
  devise_for :users
  resources :books, only: [:index, :show, :create,:destroy,:edit, :update]
  resources :users, only: [:index, :show, :create,:destroy,:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
