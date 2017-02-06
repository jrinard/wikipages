Rails.application.routes.draw do
  resources :types do
    resources :listings
  end
end
