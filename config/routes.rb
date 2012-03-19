Manosalaobra::Application.routes.draw do
  root to: 'dashboards#problems'

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
  resources :problems, path: 'preguntas', except: [:new]
  resources :solutions

  resources :user_sessions, only: :create

  # Dashboards
  match '/como' => 'dashboards#problems', as: :problems_dashboard

  # Utilizamos match para que las rutas sean más bonitas
  match '/entrar' => 'user_sessions#new', as: :login
  match '/salir' => 'user_sessions#destroy', as: :logout

  # Simula un login
  match '/enter/:id' => 'user_sessions#enter', as: :enter unless Rails.env.production?
  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes/routes.yml', { :prefix_on_default_locale => true })
end
