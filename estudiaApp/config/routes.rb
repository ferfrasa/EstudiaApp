Rails.application.routes.draw do
  
  resources :user_types
  resources :spectators
  resources :categories
  resources :status_activities
  resources :type_activities
  resources :tags
  resources :universities
  devise_for :users
  resources :articles  do #asume u controlador llamado article para recibir peticiones
  	resources :comments, only: [:create, :update, :destroy, :show]
  end	
=begin
   get "/articles" index
   post "/articles" create
   delete "/articles" delelte
   get "/articles/:id" show
   get "/articles/new" new
   get "/articles/:id/edit" edit
   patch "/articles/:id" update
   put "/articles/:id" update
=end

  post 'welcome/index'
  get 'special', to: "welcome#index"

  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
