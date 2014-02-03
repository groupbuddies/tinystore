require Rails.root.join('lib/constraints/subdomain_constraint')

Tinystore::Application.routes.draw do
  devise_for :users

  constraints(SubdomainConstraint) do
    root to: 'stores#show', as: :store
    resources :products
  end

  root to: 'pages#index'
end
