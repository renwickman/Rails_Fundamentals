Rails.application.routes.draw do
  get 'users/total' => 'users#total'
  resources :users
end
