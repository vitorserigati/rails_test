require_relative '../lib/api_constraints'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
            resources :wallet, except: %i[create update destroy]
            resources :user, only: %i[index show]
            post 'transaction', action: :create_transaction, controller: 'wallet'
          end
  end
end
