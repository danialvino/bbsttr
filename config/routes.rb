Rails.application.routes.draw do
  # user routes
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  # pages
  root to: 'pages#home'
  get '/privacy', to: 'pages#privacy_policy'
  # sitter routes
  resources :sitters
  # available dates routes
  resources :availables, only: [:new, :create]
  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :availables, only: [ :index ]
    end
  end
  # orders routes
  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
    end

  # childs routes
  resources :children, only:  [:index, :edit, :update, :show, :destroy, :new, :create]
  # available dates routes
  resources :availables, only: [:index, :edit, :update, :show]
  get :availables, to: 'availables#myavailables', as: 'my_availables'
  # bank sitter routes
  resources :bankinfos, only: [:show, :edit, :update, :new, :create]
  # booked dates routes
  resources :bookings, only: [:index, :show, :create] do
    resources :reviewssitters, only: [:new, :create]
    resources :reviewsparents, only: [:new, :create]
  end
  # update booking status to "canceled"
  patch '/bookings/:id/change-status-to-canceled', to: "bookings#change_status_to_canceled", as: "change_booking_status_to_canceled"
  # reviewsparents routes
  resources :reviewsparents, only: [:index, :new, :create]
  # reviewssitters routes
  resources :reviewssitters, only: [:index, :new, :create]
  # favorites routes
  resources :favorites, only: [:index, :new, :create, :destroy]
  # sidekiq routes
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
