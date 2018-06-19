Rails.application.routes.draw do
  resources :tickets
  resources :projects
  resources :employee_projects
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
