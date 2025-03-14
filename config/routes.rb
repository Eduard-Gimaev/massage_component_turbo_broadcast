Rails.application.routes.draw do
  root "messages#index"
  resources :messages, only: %i[index create edit update destroy]

  # mount ActionCable.server => '/cable'

  get "up" => "rails/health#show", as: :rails_health_check
end
