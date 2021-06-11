Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'chatroom#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :messages

  resources :users, except: [:new]
  get 'signup', to: 'users#new'

  #this route will handle the messages being sent from chatroom to message controller create action
  post 'message', to: 'messages#create'

  #to mount our channel route(to set route channel so it can communicate to my app)
  mount ActionCable.server, at: '/cable'

end
