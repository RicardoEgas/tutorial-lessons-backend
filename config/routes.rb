Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 controllers: {
                   sessions: 'api/v1/sessions',
                   registrations: 'api/v1/registrations'
                 }

        resources :tutorials, only: [:index, :show, :create, :update, :destroy] do
        resources :reservations, only: [:index, :create, :destroy]
      end

      get '/user_reservations', to: 'reservations#user_reservations'
    end
  end

end
