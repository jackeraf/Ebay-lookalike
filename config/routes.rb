Rails.application.routes.draw do
  devise_for :users
  resources :products do
  	resources :ratings
  	resources :bids
  end
  root "page#index"
  get '/about', to: 'page#about_the_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
