Rails.application.routes.draw do
  root to: 'contacts#index'

  resources :countries, defaults: {format: :json}
  resources :contacts, defaults: {format: :json}

  resources :images do
    post "upload", :on=>:collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
