Rails.application.routes.draw do
 root "tops#index"
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

 resources :families do
   post :share, on: :member
 end
end
