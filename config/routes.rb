Rails.application.routes.draw do

    root 'links#index'

    # Rename devise routes, and define custom controller
    devise_for :users,
        path: 'user',
        controllers: {
            registrations: 'registrations'
        },
        path_names: {
            sign_in: 'login',
            sign_out: 'logout',
            sign_up: 'register'
        }

    # Extend user routes
    resources :users,
        path: 'user',
        only: [:index, :show]

    get '~:id', to: 'users#show'

    resources :links do
        resources :comments
    end

end
