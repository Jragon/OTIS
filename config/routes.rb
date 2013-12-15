OTIS::Application.routes.draw do
  
  get "reports/index"
  get "reports/village/:id", to: 'reports#village'
  get "reports/national_office"
  get "reports/regional_office"
  get "reports/programme"
  get "reports/world_vision"

  resources :themes

  resources :fruits do
    post :sort, on: :collection
  end

  resources :conversations do
    resources :fruits do
      post :sort, on: :collection
    end

    resources :threats do
      post :sort, on: :collection
    end

    resources :contributors do
      post :sort, on: :collection
    end
  end 

  resources :discussions do 
    get 'changes', on: :member
    resources :conversations do
      post :sort, on: :collection
    end
  end

  resources :groups do
    get 'changes', on: :member
  end

  resources :changes

  resources :villages do
    get 'changes', on: :member
    resources :discussions
  end

  resources :programmes, only: [] do
    get 'changes', on: :member
    resources :villages
  end

  resources :national_offices do
    get 'changes', on: :member
    resources :programmes do 
      resources :villages
    end
  end

  resources :regional_offices do
    get 'changes', on: :member
  end

  root 'regional_offices#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
