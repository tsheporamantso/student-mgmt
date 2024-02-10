class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = 'Student created successfully'
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(student_params)

    if @student.update
      flash[:success] = 'Student updated successfully'
      redirect_to student_path(@student)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
