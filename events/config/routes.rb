Rails.application.routes.draw do

  resources :categories

	get "signup" => "users#new"
	resource :session
  resources :users

  root "events#index"

  resources :events do
    resources :registrations
		resources :likes
  end
end
