class SessionsController < ApplicationController
  #login page
  def new
  end
  #try login
  def create
    puts "#{params[:email]}, #{params[:password]}"
    u = User.find_by_email(params[:email]).try(:authenticate, params['password'])
    puts "User login attempt for #{params[:email]} result: #{u}"
    redirect_to '/sessions/new'
  end
  #logout
  def destroy
    redirect_to '/sessions/new'
  end
end
