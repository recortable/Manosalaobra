Manosalaobra::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, path: 'entradas'
  resources :users, path: 'usuarios'
  resources :comments, only: :create
  resources :names, path: 'propuestas_nombre', except: :show

  # Simula un login
  match '/entrar/:id' => 'users#enter'
end
