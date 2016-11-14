Rails.application.routes.draw do
  get 'message/new'
  post 'message/', to: 'message#create', as: 'message_create'

  root 'message#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
