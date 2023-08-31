class AdminsController < ApplicationController

  def students
    @students = Student.paginate(page: params[:page], per_page: 10)
    @student_new = Student.new
  end

  def create_student
    @student_new = Student.new(student_params)
    if @student_new.save
      redirect_to '/admin/students', flash: { success: 'Student was successfully created.' }
    else
      @students = Student.paginate(page: params[:page], per_page: 10)
      @alert_message = 'Failed to create student. Please check the form.'
      render :students
    end
  end  
  
  private

  def student_params
    params.require(:student).permit(:name, :last_name, :email, :account, :group, :grade)
  end

end
  