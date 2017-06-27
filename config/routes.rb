Rails.application.routes.draw do
  resources :emails
  get 'homes/home'

  get 'homes/contact'
  get 'homes/edit'
  post 'homes/update'
  get 'homes/profile'

  devise_for :users

  resources :chat_rooms, only: [:new, :create, :show, :index]
  

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
end
