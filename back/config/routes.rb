Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
      get 'csv', to: 'books#get_csv'

      root 'home#index'
      resources :books, only: [:index,:create, :update, :destroy]
      resources :users, only: [:new,:create]
    end
  end
end
