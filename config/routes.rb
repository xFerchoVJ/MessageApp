Rails.application.routes.draw do
  root to: 'chatroom#index'
  get 'login', to: 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
