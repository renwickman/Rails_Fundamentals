Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  get 'secrets/index'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'sessions/new'
  post 'sessions' => 'sessions#create'
  get 'sessions/logout' => 'sessions#destroy'
end
