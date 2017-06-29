Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'static_pages#home'

  resources :menus, only: %i(index show) do
    resources :meals, only: :index
  end
end
