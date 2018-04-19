Rails.application.routes.draw do
  devise_for :customers
  namespace :admin do
    devise_for :super_users, controller:
      {session: 'admin/sessions'}
    resources :categories_products
    resources :categories
    resources :products
    resources :banners
    root controller: :dashboard, action: :index
  end

  root controller: :application, action: :index
  get 'category', to: 'application#category', as: 'category'
  get 'product', to: 'application#product', as: 'product'
  get 'search', to: 'search#search', as: 'search'

  resources :shoppingcart, only: [:index] do
    collection do
      post :reload_quantity
      post :delete_item
    end
  end

end
