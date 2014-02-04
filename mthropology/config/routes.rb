Mthropology::Application.routes.draw do
  devise_for :users
  root to: 'home_page#index'
  resources :expos, :only => :index
  resources :users do
    resources :idealogs, :expos
  end

end
