Manosalaobra::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, path: 'entradas'
  resources :users, path: 'usuarios'
  resources :comments, only: :create
  resources :proposed_names, path: 'nombres', except: :show do
    resources :votes, path: 'votos'
  end

  # Simula un login
  match '/entrar/:id' => 'users#enter'
end
