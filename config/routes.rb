Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :items, except: [:destroy]
    resources :categories, except: [:destroy, :show, :new]
    resources :customers, except: [:destroy, :new, :create]
    resource :homes, only: [:top]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    resource :homes, only: [:top, :about]
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]      # <= current_userで:id不要？
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
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
