Rails.application.routes.draw do
  resources :clients
  resources :pets do
    resources :pet_histories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "clients#index"
end
