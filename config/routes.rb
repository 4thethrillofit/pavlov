Pavlov::Application.routes.draw do
  get "payment/create"
  resources :challenges do
    resources :participations, :only => [:create, :destroy]
  end
  root :to => 'challenges#index'
end
