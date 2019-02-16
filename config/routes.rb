Rails.application.routes.draw do
  #Eliminar estas rutas porque las vamos a manejar a través del resources
  #get 'pins/index'
  #get 'pins/show'
  #get 'pins/edit'
  #get 'pins/new'
  
  devise_for :users
  get 'pages/index'
  get 'pages/home'
  
  #Esto es la misma estructura del modelo
  post 'pins/:id/like', as: 'pins_like', to: 'pins#like'

  #rest routes
  resources :pins
  
  root 'pins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
