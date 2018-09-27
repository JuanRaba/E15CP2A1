Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'histories/mine', to: "histories#mine"
  resources :histories

  get 'users', to: "users#index"
  get 'users/destroy/:id', to: "users#destroy", as: "userdestroy"
  get 'users/addtoadmin/:id', to: "users#addtoadmin", as: "addtoadmin"
  get 'users/removeadmin/:id', to: "users#removeadmin", as: "removeadmin"

  root "histories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
