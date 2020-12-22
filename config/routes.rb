Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'devise/customers/sessions',
    passwords:     'devise/customers/passwords',
    registrations: 'devise/customers/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :items, except: [:destroy]
      get 'top' => 'items#top'
    
    resources :categories, except: [:destroy, :show, :new]
    resources :customers, except: [:destroy, :new, :create]
      get "search" => "customers#search"
    resource :homes, only: [:top]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]

  end

  scope module: :public do
    resource :homes, only: [:top, :about]
    resources :items, only: [:index, :show] do
      member do
        get "search" => "items#search"   #<=サーチアクション
      end
    end
    #resouceだとurlが複数形になるため  resource => resources
    resources :customers, only: [:show, :edit, :update]      # <= current_userで:id不要？
    get "customer/:id/unsubscribe" => "customers#unsubscribe", as: 'customer_unsubscribe'
    patch 'customer/:id/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    resources :cart_items, except: [:new, :show, :edit] do
      collection do    #<=追加cart_item

        delete "all_destroy"
      end
    end

    resources :orders, except: [:destroy, :edit, :update] do
    member do
    get "complete"
    end
    end

    post "orders/confirm" => "orders#confirm"
    resources :shippings, except: [:new, :show]

    root to: "homes#top"
    get 'home/about' => 'homes#about'
  end
end
