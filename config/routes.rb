Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/hospitals", to: "hospitals#index"
  get "/hospitals/new", to: "hospitals#new"
  post "/hospitals", to: "hospitals#create"
  get "/hospitals/:id", to: "hospitals#show"
  post "/hospitals/:id/patients", to: "hospital_patients#create"
  get "/hospitals/:id/patients/new", to: "hospital_patients#new"
  get "/hospitals/:id/patients", to: "hospital_patients#index"
  get "/hospitals/:id/patients/:id", to: "patients#show"
  get "/hospitals/:id/edit", to: "hospitals#edit"
  patch "/hospitals/:id", to: "hospitals#update"

  
  get "/patients/:id/edit", to: "patients#edit"
  patch "/patients/:id", to: "patients#update"
  get "/patients", to: "patients#index"
  get "/patients/:id", to: "patients#show"
  delete "/hospitals/:id", to: "hospitals#destroy"
  delete "/patients/:id", to: "patients#destroy"
end

