Rails.application.routes.draw do
  # user routes
  devise_for :users
  root to: 'pages#home'
  # sitter routes
  resources :sitters
  resources :availables, only: [:new, :create]
  resources :users, only: [] do
    resources :childs, only: [:new, :create]
  end

  # childs routes
  resources :childs, only:  [:index, :edit, :update, :show, :destroy]
  # available dates routes
  resources :availables, only: [:index, :edit, :update, :show]
  get :availables, to: 'availables#myavailables', as: 'my_availables'
  # booked dates routes
  resources :bookings, only: [:index, :show]
end
