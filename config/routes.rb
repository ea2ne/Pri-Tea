Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get "users/show" => "users#show"
  root to: 'messages#index'
  resources :messages
  resources :users, only: :show

end
