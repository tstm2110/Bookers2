Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  resources :users, only: [:show, :edit, :update, :index ]
  resources :books
  get 'home/about' => 'home#about'


resources :book_comments


resources :books, only: [:new, :create, :index, :show, :destroy] do
 resources :book_comments, only: [:create, :destroy]
 resource :favorites
end
  end
