Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # public endpoints
      devise_for :authors,
        path: "auth",
        path_names: {
          sign_in: "login",
          sign_out: "logout",
          registration: "signup"
        },
        defaults: { format: :json },
        controllers: {
           sessions: "api/v1/authors/sessions",
           registrations: "api/v1/authors/registrations"
          }

      # private endpoints
      resources :posts, only: %i[index show create update destroy]
      resources :comments, only: %i[index show create update destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "posts#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
