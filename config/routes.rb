Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/hospitals", to: "hospitals#index"
  get "/hospitals/:id", to: "hospitals#show"
  get "/hospitals/:id/patients", to: "hospitals#show_patients"
  
  get "/patients", to: "patients#index"
  get "/patients/:id", to: "patients#show"
end
