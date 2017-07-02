Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'static_pages#home'

  resources :menus, only: %i(index show) do
    resources :meals, only: :index
  end

  resources :users, only: [:index, :show] do
    resources :orders, only: :create
  end
end
