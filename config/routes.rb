# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :goals, only: %i[show index]
      resources :dishes, only: %i[show index change]
      resources :carts, only: %i[index]
    end
  end
end
