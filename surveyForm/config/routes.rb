Rails.application.routes.draw do
  root 'forms#index'

  post '/create' => 'forms#create'

  get '/submit' => 'forms#submit'

end
