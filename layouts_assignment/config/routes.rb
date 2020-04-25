Rails.application.routes.draw do
  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/create' => 'posts#create'

  get 'users/index' => 'users#index'

  get 'users/new' => 'users#new'

  post 'users/create' => 'users#create'

end
