Rails.application.routes.draw do

  root 'hellos#index'
  get 'hello' => 'hellos#hello'
  get 'say/hello(/:name)' => 'hellos#say'
  get 'times' => 'hellos#times'
  get 'restart' => 'hellos#restart'
end
