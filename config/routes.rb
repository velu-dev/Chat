Rails.application.routes.draw do
  
  get 'homes/home'

  get 'homes/contact'

  get 'homes/edit'

  post 'homes/update'

  get 'homes/profile'

  get 'chat_manage/show'

  get 'chat_manage/edit'

  patch 'chat_manage/update'

  get 'chat_manage/delete'

  get 'chat_manage/profile'
  
  resources :emails

  devise_for :users
get 'chat_rooms/delete'
  resources :chat_rooms, only: [:new, :create, :show, :index, :delete]

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'

end
