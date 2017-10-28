Rails.application.routes.draw do
  root "products#index"

  devise_for :users

  resources :products
  
  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

  resources :orders do
    resources :order_items
  end
  
end
