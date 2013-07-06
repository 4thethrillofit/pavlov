Pavlov::Application.routes.draw do
  get "payment/create"
  resources :challenges
  root :to => 'challenges#index'
end
