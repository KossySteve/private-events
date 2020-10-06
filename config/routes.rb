Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  root 'users#show'  
  resources :users
  resources :sessions
  resources :events do
    resources :attendances
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
