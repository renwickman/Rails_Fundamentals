class StudentsController < ApplicationController
  def index
  end

  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    student = Student.create(student_params)
    redirect_to "/dojo/#{student.dojo.id}"
  end

  def edit
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def update
    Student.find(params[:id]).update(student_params)
    redirect_to "/dojo/#{params[:dojo_id]}"
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @students = Student.where(dojo_id: params[:dojo_id])
    @people = []
    @students.each do |student|
      if @student.created_at.beginning_of_day == student.created_at.beginning_of_day
        @people << student
      end
    end
  end

  def delete
    Student.find(params[:id]).destroy
  	redirect_to "/dojo/#{params[:dojo_id]}"
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
