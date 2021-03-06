Rails.application.routes.draw do

  root "welcome#index"

  get 'welcome/index'

  resources :products, :only => [:index, :show] do
    resources :order_items, :only => [:create, :update, :destroy]
    resources :reviews
    post 'add_to_cart', on: :member
  end
  get 'search' => 'products#search', as: 'search_product'

  resources :users, :only => [:new, :create, :show, :edit, :update] do
    resources :reviews
    scope module: :users do
      resources :products
      resources :fulfillment, :only => [:index, :show]
    end
  end

  resources :orders, :only => [:show, :edit, :update]

  resources :order_items, :only => [:show]

  resources :sessions, :only => [:create]
  delete "/logout" => "sessions#destroy"
  get    "/login"  => "sessions#new"

  resources :categories, :only => [:new, :create]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    # resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end




end
