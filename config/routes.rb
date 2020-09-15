Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
  root 'messages#index'
  resources :messages

  # post "messages/create" => "messages#create"
end
