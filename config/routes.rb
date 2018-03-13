Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new          # match '/login' => 'sessions#new', via: ['get'], :as => 'login'
    post 'login' => :create
    delete 'logout' => :destroy
  end



  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :products do 
    get :who_bought, on: :member # '/products/:id/who_bought'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
