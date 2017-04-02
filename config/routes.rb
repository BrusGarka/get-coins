Rails.application.routes.draw do


    namespace :api, defaults: {format: 'json'} do
      namespace :v1 do
        namespace :authentication do
          put 'omniauth/:provider' => 'omniauth#omniauth'
          patch 'omniauth/:provider' => 'omniauth#omniauth'
          post 'passwords' => 'passwords#create'
          patch 'passwords' => 'passwords#update'
          put 'passwords' => 'passwords#update'
          post 'registrations' => 'registrations#create'
          delete 'registrations' => 'registrations#destroy'
          post 'sessions' => 'sessions#create'
          delete 'sessions' => 'sessions#destroy'
        end
      end
    end



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
