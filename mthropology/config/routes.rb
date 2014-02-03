Mthropology::Application.routes.draw do
  root to: 'expos#index'
  get '/images' => 'images#show'
  resources :users do
    resources :idealogs, :expos
  end

end
