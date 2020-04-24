class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
  end

  def create
    dojo = Dojo.create(dojo_params)
    if !dojo.valid?
      flash[:errors] = dojo.errors.full_messages
      redirect_to '/new'
    else
      dojo.save
      redirect_to '/'
    end
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def update
    Dojo.find(params[:id]).update(dojo_params)
    redirect_to '/'
  end

  def show
    @dojo = Dojo.find(params[:id])
    @students = @dojo.students
  end

  def delete
    dojo = Dojo.find(params[:id])
    dojo.destroy
    redirect_to '/'
  end

  private
  def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
  end

end
