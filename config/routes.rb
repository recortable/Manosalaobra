Manosalaobra::Application.routes.draw do
  root to: 'dashboards#show'


  resources :posts do
    resources :comments, only: :create
  end
  resources :comments
  resources :pages
  resources :users do
    post :subscribe, on: :collection
  end
  resources :proposed_names do
    resources :votes
  end
  resources :media_items, path: 'multimedia'
  resources :phases, path: 'fases' do
    resources :problems, path: 'preguntas', only: [:new]
  end
  resources :groups, path: 'colectivos'
  resources :problems, parh: 'preguntas', except: [:new]

  resources :user_sessions, only: :create

  # Utilizamos match para que las rutas sean más bonitas
  match '/entrar' => 'user_sessions#new', as: :login
  match '/salir' => 'user_sessions#destroy', as: :logout

  # Simula un login
  match '/enter/:id' => 'user_sessions#enter', as: :enter unless Rails.env.production?
  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes/routes.yml', { :prefix_on_default_locale => true })
end
