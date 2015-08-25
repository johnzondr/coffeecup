require 'api_constraints'

Coffeecup::Application.routes.draw do
  # resources :users
  # root 'users#index'
  
  #constraints :subdomain => 'api' do
    namespace :api, path: nil, defaults: {format: 'json'} do
      scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        
      end

      scope module: :v3, constraints: ApiConstraints.new(version: 3) do
        resources :friendrequests
        resources :friendships, :only => [:index, :put, :patch]
        resources :users
        #get ':users(/status)' 
        put '/users/status', to: 'users#status', as: 'user_status'
        resources :venues, :only => [:index, :show]
        resources :invitations

      end
    end
  
  # end
end
