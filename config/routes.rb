Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trades, only: [:index], format: 'json' do 
    collection do 
      get :generate_gain
    end
  end
end
