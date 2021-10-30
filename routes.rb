Rails.application.routes.draw do
  root 'posts#index'
  
  get '/search' => 'search#search'
  
  resources :users, only:[:index, :edit, :update]
  get '/users/show/:id', to: 'users#show'
  resources :posts, only:[:show, :new,:create, :edit, :update, :destroy]
  resources :items, only:[:new,:create]
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
