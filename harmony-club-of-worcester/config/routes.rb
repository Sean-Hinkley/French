Rails.application.routes.draw do

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/sessions#new", as: "new_user_registration" # custom path to sign_up/registration
  end
  devise_for :users, :skip => [:registrations] 
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  #devise_for :users

  namespace :web do
    get 'contact/index'
    post 'contact/index'
  end
  namespace :web do
    get 'sponsors/index'
    get 'sponsors/show'
    get 'events/index'
    get 'events/show'
    get 'albums/index'
    get 'albums/show'
    get 'site/home'
    #get 'site/page'
    get 'site/pdf/:id', to: "site#pdf", as: :pdf
    get 'site/:id', to: "site#page", as: :site_page
  end

  namespace :auth do
    resources :events
    resources :albums
    resources :sections
    resources :pages
    resources :sponsors
    resources :photos
    resources :roles
    resources :permissions
    get 'site/panel'
    get 'site/page'
    get 'site/change_form_fields'
    get 'site/change_permissibles'
    get 'site/change_permissible_id'
    get 'user_management/index'
    get 'user_management/show'
    get 'user_management/new'
    post 'user_management/new'
    delete 'user_management/index'
  end

  
  root 'web/site#home'
end
