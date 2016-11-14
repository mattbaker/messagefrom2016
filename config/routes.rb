Rails.application.routes.draw do
  get  '/message/new'
  post '/message/', to: 'message#create', as: 'message_create'
  get  '/message/confirm/:token', to: 'message#confirm', as: 'message_confirm'
  root 'message#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
