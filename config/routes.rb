Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end


  scope "(:locale)", locale: /de|en/ do
    root 'events#index'

    get 'log_out' => 'sessions#destroy', as: 'log_out'
    get 'log_in'  => 'sessions#new',     as: 'log_in'
    resources :sessions

    resources :events, concerns: :paginatable, only: [:index, :show, :new, :create, :update] do
      resources :comments, only: [:create]
    end

    get 'tags/:tag', to: 'events#index', as: :tag
  end

  namespace :admin do
    root to: "home#start"
    resources :pages
    resources :events do
      member do
        patch 'publish'
        patch 'hide'
        patch 'uncheck'
      end
    end
    resources :comments do
      member do
        patch 'publish'
        patch 'hide'
        patch 'uncheck'
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
