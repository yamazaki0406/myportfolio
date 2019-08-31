Rails.application.routes.draw do
 root "static_pages#home"
 get "/home", to: "static_pages#home"
 get "/help", to: "static_pages#help"
 get "/about", to: "static_pages#about"
 get "/edit", to: "static_pages#edit"
 get "/signup", to: "users#new"
 post "/signup", to: "users#create"
 resources :users
 get "/login", to: "sessions#new"
 post "/login", to: "sessions#create"
 delete "/logout", to: "sessions#destroy"
 resources :children, except: [:index] do
   delete :purge, on: :member
 end
 resources :growths do
   get :detail, on: :member
 end
 resources :microposts do
   delete :purge, on: :member
 end

 resources :familys
end
