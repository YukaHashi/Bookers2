Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  
  resources :books, only:[:new, :create, :index, :show]
  
  # post '/books/new' => "books#new", as: "new_book"
  
  get '/homes/about' => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
