Rails.application.routes.draw do
  resources :teams do
    resources :members, only: [ :new, :edit, :create, :update, :destroy ]
  end
  resources :ashes_mobs, path: "/ashes/mobs"
  resources :ashes_items, path: "/ashes/items" do
    member do
      post "import"
    end
  end

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :ledgers do
    collection do
      get "deposit"
      get "withdraw"
    end
  end

  resources :players do
    resource :ledgers do
      collection do
        get "deposit"
        get "withdraw"
      end
    end
    member do
      delete "leave_guild"
    end
  end
  resources :members
  resources :guilds
  resources :items
  resources :rarities
  resources :users, only: [ :index, :show, :edit, :update ]

  resources :timers do
    member do
      patch "reset"
      patch "share"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "welcome#index"
end
