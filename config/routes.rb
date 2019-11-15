Rails.application.routes.draw do
 root "tops#index"

 resources :users
 get "/signup", to: "users#new"
 post "/signup", to: "users#create"

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

 resources :families do
   post :share, on: :member
 end

 resources :maps
 get '/map_request', to: 'maps#map', as: 'map_request'

 get "/edit", to: "static_pages#edit"

end
