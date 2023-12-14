Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users', to: 'registrations#create'
      post '/users/sign_in', to: 'sessions#create'

      resources :tutorials, only: [:index, :show, :create, :update, :destroy] do
        resources :reservations, only: [:index, :create, :destroy]
      end

      get '/user_reservations', to: 'reservations#user_reservations'
    end
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
