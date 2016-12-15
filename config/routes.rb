Rails.application.routes.draw do
  get 'admin', to: 'admin#index'

  get  '/messages/new'
  post '/messages', to: 'message#create', as: 'message_create'
  get  '/messages/confirm/:token', to: 'message#confirm', as: 'message_confirm'
  root 'message#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
