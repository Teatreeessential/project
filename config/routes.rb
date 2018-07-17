Rails.application.routes.draw do
  resources :users do
    member do
      get '/profile' => 'users#profile'
    end
    collection do
      get '/repos' => 'users#repos'
      get '/show' => 'users#show'
      post '/search' => 'users#search'
      post '/find_partner' => 'users#find_partner'
      post '/register' => 'users#register'
      get '/list' => 'users#list'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
