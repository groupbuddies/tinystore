Tinystore::Application.routes.draw do
  devise_for :users

  get '/' => 'pages#index'
  get 'uikit' => 'pages#uikit'

  root to: 'pages#index'
end
