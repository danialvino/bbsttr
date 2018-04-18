Rails.application.routes.draw do

  # errors routes
  match "/404", :to => "errors#not_found", :via => :all
  match "/422", :to => "errors#Unprocessable", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # user routes
  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }

  # pages
  root to: 'pages#home'
  get '/privacy', to: 'pages#privacy_policy'
  get "/about", to: 'pages#about', as: "about"
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
  resources :availables, only: [:index, :edit, :update, :show, :destroy]
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
  # update check in
  get '/bookings/checkin', to: 'bookings#start_work', as: 'checkin'
  # update check out
  get '/bookings/checkout', to: 'bookings#finished_work', as: 'checkout'
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
