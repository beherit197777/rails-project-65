Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # namespace :web do
  #   get 'profile/show'
  # end
  scope module: :web do
    post "/auth/:provider", to: "auth#request", as: :auth_request
    get "/auth/:provider/callback", to: "auth#callback", as: :callback_auth
    delete "/auth/logout", to: "auth#destroy"
    namespace :profile do
      resource :profiles, only: %i[show]
    end
    resources :bulletins, only: %i[index show new edit create update] do
      member do
        patch :to_moderation, :archive
      end
    end

    root to: "bulletins#index"

    namespace :admin do
      root to: "bulletins#on_moderation"
      resources :bulletins, only: :index do
        get :on_moderation, on: :collection
        member do
          patch :publish, :archive, :reject
        end
      end
      resources :categories, only: %i[index new edit create update destroy]
    end
    # scope module: :profile do
    #   get 'profile', to: 'profile#show'
    # end
  end
end
