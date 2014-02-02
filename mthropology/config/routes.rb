Mthropology::Application.routes.draw do

  resources :users do
    resources :idealogs, :expos
  end

end
