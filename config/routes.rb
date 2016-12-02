Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  get 'view_english' => 'users#view_english'
  get 'view_spanish' => 'users#view_spanish'
  post 'view_english' => 'users#view_english'
  post 'view_spanish' => 'users#view_spanish'
  
  get 'exports', to: 'admins#exports'
  resources :users, only: [:index, :edit, :update]
  get 'posts_export', to: 'posts#export'
  get 'tagged_export', to: 'tagged_posts#export'
  
  resources :profiles, only: [:show, :edit, :update]
  resources :posts, only: [:index, :show, :create, :like, :destroy] do
    resources :comments
    member do
      put 'like'
      put 'dislike'
      put 'help'
      put 'unhelp'
      put 'inspire'
      put 'uninspire'
    end
  end
  get 'posts/:id/edit', to: 'posts#edit', as: :edit_post
  put 'posts/:id', to: 'posts#update'
  resources :tagged_posts, only: [:index, :show, :create, :like, :destroy] do
    resources :taggedcomments
    member do
      put 'like'
      put 'dislike'
      put 'help'
      put 'unhelp'
      put 'inspire'
      put 'uninspire'
    end
  end
  get 'tagged_posts/:id/edit', to: 'tagged_posts#edit', as: :edit_tagged_post
  put 'tagged_posts/:id', to: 'tagged_posts#update'
  root 'welcome#index'
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
