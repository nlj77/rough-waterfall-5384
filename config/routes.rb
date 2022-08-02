Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :customers, only: [:show]
  get 'customers/:id', to: 'customers#show'
  #Would refuse to work unless handrolled ^^ for some reason
  
  resources :supermarkets, only: [:show] do
    resources :items, only: [:index]
  end


end



