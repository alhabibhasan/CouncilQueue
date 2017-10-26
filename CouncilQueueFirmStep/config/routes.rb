Rails.application.routes.draw do
  resources :council_queues
  root to: "council_queues#index"
end
