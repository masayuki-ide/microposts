Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'edit_user'   => 'users#edit'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  
  resources :relationships, only: [:create, :destroy]
  
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :favorites

end