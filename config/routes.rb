Manosalaobra::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, path: 'entradas' do
    resources :comments, only: :create
  end
  resources :users, path: 'usuarios'
  resources :proposed_names, path: 'nombres', except: :show do
    resources :votes, path: 'votos'
  end

  # Simula un login
  match '/entrar/:id' => 'users#enter'
  # Simula el logout
  match '/salir' => 'users#logout'
end
