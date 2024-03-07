Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # namespace :admin do
  # resources :requests do
  #   collection do
  #     put 'accept_all'
  #     put 'reject_all'
  #     end
  #   end
  # end

  resources :products
  resources :users

  post "/auth/login", to: "authentication#login"

  resources :passwords, only: [:update]

  resources :password_resets, only: [:edit, :update]


  resources :password_resets do
   get :show_error, on: :collection
   get :edit_error, on: :collection
  end

    # resources :carts

  post "/add_product/:id", to: "carts#add_product"

  delete "/remove_product/:id", to: "carts#remove_product"
  get "/my_cart",  to: "carts#view_cart"

  # wishlist 

  # resources :wishlists, only: [:index, :create, :destroy]

  post "/add_product_wishlist/:id", to: "wishlists#add_product_to_wishlist"
  delete "/remove_product_wishlist/:id", to: "wishlists#remove_product_to_wishlist"
  get "/my_wishlist", to: "wishlists#view_wishlist"


  #  addresses

  resources :addresses

  resources :orders

  resources :notifications

# stripe payment

  # post "/payments", to: "payments#create"
   post "/payments/checkout", to: "payments#checkout"
   get  "/payments/retrive_checkout", to: "payments#retrive_checkout"


   resources :terms_and_conditions

   # add request of the veders to sell or items in our eCommerce Plateform

  # resources :requests, only: [] do
  #   patch :accept
  #   patch :reject
  # end

   resources :requests

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
