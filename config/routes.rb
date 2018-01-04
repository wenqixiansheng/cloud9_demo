Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :articles
  resources :regist
  
  
  #comment路由（嵌套于articles）
  resources :articles do
    resources :comments
  end
  
  
  root 'welcome#index'
  
  
  
  
  resources :users do
    collection do 
      get :show_name
      post :show_name
      get :goodbye
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
  
  
  
  #  下面的代码是自己添加的修改路由，这是第一步
  resources :books do 
    collection do 
      get :list 
      post :list
    end 
  end 
  #它会生成一段“路由”, 也就是说,会识别 /books/list 这个URL,
  #并且把它交给 books （controller） 的 list （action） 来处理
end
