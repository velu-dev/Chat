Rails.application.routes.draw do
  resources :emails
  get 'homes/home'

  get 'homes/contact'

  devise_for :users

  resources :chat_rooms, only: [:new, :create, :show, :index]

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
end
