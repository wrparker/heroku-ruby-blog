Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  
  resources :articles do #resources is plural... omg
      resources :comments
  end
  
  root 'welcome#index'
end
