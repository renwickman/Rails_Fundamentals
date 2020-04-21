class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.create(name: params[:name])
    redirect_to '/users'
  end

  def edit
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
  end

  def total
    @user = User.count
  end

end
