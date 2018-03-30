Rails.application.routes.draw do
  namespace :admin do
    resources :categories_products
    resources :categories
    resources :products

    root to: "categories_products#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
