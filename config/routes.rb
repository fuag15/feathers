Feathers::Application.routes.draw do
  devise_for :users

  root to: 'posts#index'
end
