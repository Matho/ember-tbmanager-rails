Rails.application.routes.draw do

  root to: 'contacts#index'

  devise_for :users, controllers: { sessions: 'sessions' }

  #post '/users/sign_in', to: "sessions#create", defaults: {format: :json}

  resources :countries, defaults: {format: :json}
  resources :contacts, defaults: {format: :json}

  resources :images, defaults: {format: :json} do
    post "upload", :on=>:collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
