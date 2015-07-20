Rails.application.routes.draw do
	get "signup" => "users#new"
	resource :session
  resources :users

  root "events#index"

  resources :events do
    resources :registrations
  end
end
