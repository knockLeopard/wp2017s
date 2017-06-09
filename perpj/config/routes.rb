Rails.application.routes.draw do
  root 'home#index'
  get 'show/:id' => 'home#show', as: 'home_show'
  resources :papers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
