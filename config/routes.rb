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
        resources :checkins, :only => [:create, :destroy]
        resources :users do
          collection do
            put 'status'
            put 'hide'
            delete 'hide', to: 'users#unhide', as: 'unhide'
          end
        end
        get 'version', to: 'venues#version', as: 'version'
        # put '/users/status', to: 'users#status', as: 'user_status'
        # put '/users/hide', to: 'users#hide', as: 'user_hide'
        # delete 'users/hide', to: 'users#unhide', as: 'user_unhide'
        resources :venues, :only => [:index, :show] do
          collection do
            get 'friends'
            get 'specials'
          end
        end
        resources :invitations
        #post '/token', to: 'users#fbtoken', as: 'user_fbtoken'

      end
    end
  
  # end
end
