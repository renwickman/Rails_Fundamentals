Rails.application.routes.draw do
  get 'dojos/:dojo_id/students' => 'students#index'

  get 'dojos/:dojo_id/students/new' => 'students#new'

  post 'dojos/:dojo_id/students' => 'students#create'

  get 'dojos/:dojo_id/students/:id/edit' => 'students#edit'

  get 'dojos/:dojo_id/students/:id' => 'students#show'

  patch 'dojos/:dojo_id/students/:id' => 'students#update'

  delete 'dojos/:dojo_id/students/:id' => 'students#delete'


  root 'dojos#index'

  get '/new' => 'dojos#new'

  post '/create' => 'dojos#create'

  get 'dojo/edit/:id' => 'dojos#edit'

  get 'dojo/:id' => 'dojos#show'

  patch 'dojo/:id' => 'dojos#update'

  delete 'dojo/:id' => 'dojos#delete'


end
