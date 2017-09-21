  Rails.application.routes.draw do
  resources :pictures
  devise_for :users
  resources :notes do
    get 'message', on: :member
   # resources :posts do
    # resources :comments, only: [create]
    # end
   end
  resources :posts

    root  'posts#index'
    get   'users/:id'  => 'users#show'
  end
