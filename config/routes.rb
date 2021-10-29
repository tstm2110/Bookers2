Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :users, only: [:show, :edit, :update, :index ]
  resources :books
  get 'home/about' => 'home#about'


  end
