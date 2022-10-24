Rails.application.routes.draw do


 devise_for :customers,controllers:{
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

 scope module: :public do
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :addresses, only: [:index,:edit,:create,:destroy,:update]
  get 'orders/complete'
  post 'orders/confirm'
  resources :orders, only: [:index,:show,:create,:new]

  resources :cart_items, only: [:index,:create,:update,:destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  get 'customers/mypage' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  resources :items,only:[:index,:show]
  end

  devise_for :admin,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
   root to: 'homes#top'
   resources :orders,only:[:show,:update]
   resources :customers,only:[:index,:show,:edit,:update]
   resources :genres,only:[:index,:edit,:create,:update]
   resources :items,only:[:index,:new,:show,:edit,:create,:update]
   resources :order_details,only:[:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
