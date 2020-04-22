class FormsController < ApplicationController
  def index
  end

  def create
    form = Form.new(name: params[:name], location: params[:location], language: params[:language], comment: params[:comment])
    if !form.valid?
      flash[:errors] = "The form you submitted is Invalid"
      redirect_to '/'
    else
      form.save
      session[:user] = form.id
      if session[:count]
        session[:count] += 1
      else
        session[:count] = 1
      end
      flash[:success] = "Thank you for submitting this form!  You have submitted this form #{session[:count]} times now."
      redirect_to '/submit'
    end
  end

  def submit
    @form = Form.find(session[:user])
  end

end
