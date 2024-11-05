# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  # namespace :web do
  #   get 'profiles/show'
  # end
  scope module: :web do
    post '/auth/:provider', to: 'auth#request', as: :auth_request
    get '/auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    delete '/auth/logout', to: 'auth#destroy'
    resource :profile, only: %i[show]
    namespace :profile do
      resource :profiles, only: %i[show]
    end
    namespace :admin do
      root to: 'bulletins#on_moderation', filter: :under_moderation
      resources :bulletins, only: %i[index], filter: :all do
        member do
          patch :publish, :archive, :reject, :to_moderate
        end
      end
      resources :categories, only: %i[index new edit create update destroy]
    end
    resources :bulletins, only: %i[index show new edit create update] do
      member do
        patch :to_moderate, :archive
      end
    end

    root to: 'bulletins#index'
    # scope module: :profiles do
    #   get 'profiles', to: 'profiles#show'
    # end
  end
end
