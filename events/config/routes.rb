Rails.application.routes.draw do

  resources :categories

	get "signup" => "users#new"
	resource :session
  resources :users

  root "events#index"

  get "events/filter/:scope" => "events#index", as: :filtered_events

  resources :events do
    resources :registrations
		resources :likes
  end
end
