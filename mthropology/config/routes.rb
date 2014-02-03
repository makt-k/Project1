Mthropology::Application.routes.draw do
  root to: 'images#show'
  resources :users do
    resources :idealogs, :expos
  end

end
