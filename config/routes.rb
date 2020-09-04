Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'static_pages#home'
  get'/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit', to: 'comments#edit'
  get 'admin/home', to: 'admin/static_pages#index'



  resources :posts
  resources :users

  namespace :admin do
    resources :posts
    resources :cars
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
