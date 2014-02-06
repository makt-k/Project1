Mthropology::Application.routes.draw do
  devise_for :users
  root to: 'home_page#index'
  get '/intro' => 'expos#intro'
  post '/search_images' => 'search_images#create'

  resources :expos, :only => :index
  resources :users do
    resources :idealogs, :expos
  end
end
