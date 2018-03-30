Rails.application.routes.draw do
  devise_for :super_users
  namespace :admin do
    resources :categories_products
    resources :categories
    resources :products

    root to: "categories_products#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
