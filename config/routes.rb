Rails.application.routes.draw do
  # user routes
  devise_for :users
  root to: 'pages#home'
  # sitter routes
  resources :sitters
  resources :availables, only: [:new, :create]
  resources :users, only: [] do
  end
    resources :children, only: [:new, :create]

  # childs routes
  resources :children, only:  [:index, :edit, :update, :show, :destroy]
  # available dates routes
  resources :availables, only: [:index, :edit, :update, :show]
  get :availables, to: 'availables#myavailables', as: 'my_availables'
  # bank sitter routes
  resources :bankinfos, only: [:show, :edit, :update, :new, :create]
  # booked dates routes
  resources :bookings, only: [:index, :show]
  # update booking status to "canceled"
  patch '/bookings/:id/change-status-to-canceled', to: "bookings#change_status_to_canceled", as: "change_booking_status_to_canceled"

end
