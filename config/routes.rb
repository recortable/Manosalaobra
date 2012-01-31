Manosalaobra::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, path: 'entradas'
  resources :users, path: 'usuarios'
  resources :comments, only: :create
  resources :rates, only: :create
end
