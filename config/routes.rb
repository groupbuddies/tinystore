require Rails.root.join('lib/constraints/subdomain_constraint')

Tinystore::Application.routes.draw do
  devise_for :users

  constraints(SubdomainConstraint) do
    root to: 'stores#show', as: :store
    resources :products, only: [:show]

    namespace :manager do
      resources :products, only: [:show, :new, :create, :edit, :update]
    end
  end

  root to: 'pages#index'
end
