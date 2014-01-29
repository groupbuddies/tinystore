Tinystore::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get '/' => 'pages#index'

  root to: 'pages#index'
end
