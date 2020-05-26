Rails.application.routes.draw do
    resources :users do
        resources :projects, except: [:index] 
        get "projects", to: 'projects#projects', as: 'projects_profile'
    end 
    get "create_project", to: 'users#createproject'
    get "create_feature", to: 'projects#createfeature' 
    resources :features do
      resources :comments
    end  
    
    get "/view", to: 'features#view', as: 'view'
    resources :finds
    resources :password_resets, only: [:new, :create, :edit, :update]
    post "task", to:'features#create', as: 'add_task'
    post "save", to: 'features#savetask'
    
    
    get "", to: 'sessions#index'
    get "/welcome", to: 'sessions#welcome'
    post "/login", to:'sessions#create'
    get "/login", to: 'sessions#new'
    get "authorized", to: 'sessions#page_requires_login'
    delete "/welcome", to: 'sessions#destroy'
end
