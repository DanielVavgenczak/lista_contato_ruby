Rails.application.routes.draw do
  get 'session/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index";

  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
  get 'entrar', to: 'session#new'
  post 'entrar', to: 'session#create'
  delete 'sair', to: 'session#destroy'
  resources :contacts
  resources :users, only: [:new, :create, :show]
end
