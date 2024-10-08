Rails.application.routes.draw do

  devise_for :users
  
  resources :books, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only:[:index, :show, :edit, :update]

  root to: 'home#top'
  get '/home/about' => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
