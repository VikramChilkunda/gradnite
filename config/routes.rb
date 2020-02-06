Rails.application.routes.draw do
  get 'posts/new'

  root                    'buses#index'
  get 'help'        =>    'static_pages#help'
  get 'signup'      =>    'users#new'
  get 'login'       =>    'sessions#new'
  post 'login'      =>    'sessions#create'
  delete 'logout'   =>    'sessions#destroy'
  
  get 'createpost'  =>    'posts#new'
  resources :users
  resources :buses
  resources :seats
  resources :posts
end
