Rails.application.routes.draw do
  resources :tickets
  resources :projects
  resources :employee_projects
  resources :employees
  resources :sessions, only: [:new, :create]
  delete "/sessions", to: "sessions#destroy", as: "destroy_session"
  get "/analytics", to: "analytics#index"
  get "/login" => redirect("/sessions/new")
  get "/home", to: "employees#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
