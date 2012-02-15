Manosalaobra::Application.routes.draw do
  root to: 'dashboards#wip'
  match '/inicio' => 'dashboards#show'
  resources :posts, path: 'entradas' do
    resources :comments
  end
  resources :pages, path: 'paginas'
  resources :users, path: 'usuarios'
  resources :proposed_names, path: 'nombres', except: :show do
    resources :votes, path: 'votos'
  end

  resources :user_sessions, only: :create
  # Utilizamos match para que las rutas sean más bonitas
  match '/entrar' => 'user_sessions#new', as: :login
  match '/salir' => 'user_sessions#destroy', as: :logout

  # Simula un login
  match '/entrar/:id' => 'users#enter'
end
