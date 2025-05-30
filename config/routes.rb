Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :countries, only: [:index, :show] do
    resources :jobs, only: [:index]
  end
  resources :jobs, only: [:index, :show] do
    resources :job_applications, only: [:create]
  end

  resources :job_applications, only: [:index, :show] do
    collection do
      get :my_applications  # Custom route to list applications for the current user
      get :my_journeys    # Custom route to list journeys for the current user
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
