Rails.application.routes.draw do
  

 
  devise_for :users
  

  resources :pages do 
  	resources :comments
  end

  resources :photos do 
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to=> "pages#new"
  
end
