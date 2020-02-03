Rails.application.routes.draw do
  root                    'buses#home'
  get 'help'        =>    'static_pages#help'
  get 'signup'      =>    'users#new'
  get 'login'       =>    'sessions#new'
  post 'login'      =>    'sessions#create'
  delete 'logout'   =>    'sessions#destroy'
  resources :users
end
