Rails.application.routes.draw do
  devise_for :super_users
  namespace :admin do
    resources :categories_products
    resources :categories
    resources :products

    root controller: :dashboard, action: :index
  end

  root controller: :application, action: :index

end
