Manosalaobra::Application.routes.draw do
  root to: 'dashboards#show'
  resources :posts, path: 'blog' do
    resources :comments
  end
  resources :pages, path: 'paginas'
  resources :users, path: 'participantes'
  resources :proposed_names, path: 'nombres' do
    resources :votes, path: 'votos'
  end
  resources :media_items, path: 'multimedia'

  resources :user_sessions, only: :create
  # Utilizamos match para que las rutas sean más bonitas
  match '/entrar' => 'user_sessions#new', as: :login
  match '/salir' => 'user_sessions#destroy', as: :logout

  # Simula un login
  match '/enter/:id' => 'users#enter' unless Rails.env.production?
end
