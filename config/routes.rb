Rails.application.routes.draw do
    resources :users, only: [:new, :create, :show]
    get "", to: 'sessions#index'
    get "/welcome", to: 'sessions#welcome'
    post "/login", to:'sessions#create'
    get "/login", to: 'sessions#new'
    get "authorized", to: 'sessions#page_requires_login'
    delete "/welcome", to: 'sessions#destroy'
    resources :projects
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
