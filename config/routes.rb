Pavlov::Application.routes.draw do
  get "payment/create"
  resources :challenges
end
