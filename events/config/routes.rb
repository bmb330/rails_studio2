Rails.application.routes.draw do
  resources :likes

	get "signup" => "users#new"
	resource :session
  resources :users

  root "events#index"

  resources :events do
    resources :registrations
  end
end
