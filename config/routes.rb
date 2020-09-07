Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'static_pages#home'
  get'/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'admin/home', to: 'admin/static_pages#index'


  resources :users
  resources :posts
  resources :registrations
  resources :registrateds

  resources :comments do
    resources :subcomments
  end  


  namespace :admin do
    resources :posts
    resources :cars
    resources :registrateds
    resources :registrations
  end
  resources :follows, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
