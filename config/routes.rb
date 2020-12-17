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
    resources :categories, except: [:destroy, :show, :new]
    resources :customers, except: [:destroy, :new, :create]
    resource :homes, only: [:top]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]

    root to: "homes#top"
  end

  scope module: :public do
    resource :homes, only: [:top, :about]
    resources :items, only: [:index, :show]
    #resouceだとurlが複数形になるため  resource => resources
    resources :customers, only: [:show, :edit, :update]      # <= current_userで:id不要？
    get "unsubscribe/:email" => "customers#unsubscribe", as: 'confirm_unsubscribe'
    patch ':id/withdraw/:email' => "customers#withdraw", as: 'withdraw_customer'
    put 'withdraw/:email' => 'customers#withdraw'
    resources :cart_items, except: [:new, :show, :edit]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, except: [:destroy, :edit, :update]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :shippings, except: [:new, :show]

    root to: "homes#top"
    get 'home/about' => 'homes#about'
  end


end
