class AdminsController < ApplicationController

  #-----------------------------------------------------------------------------------------------

  def students
    @students = Student.paginate(page: params[:page], per_page: 12)
    @student_new = Student.new
  end

  def create_student
    @student_new = Student.new(student_params)
    if @student_new.save
      redirect_to '/admin/students', flash: { success: 'Student was successfully created.' }
    else
      @students = Student.paginate(page: params[:page], per_page: 12)
      @alert_message = 'Failed to create student. Please check the form.'
      render :students
    end
  end
  
  def edit_student
    @student = Student.find(params[:id])
  end

  def update_student
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to '/admin/students', flash: { success: 'Student was successfully updated.' }
    else
      render :edit_student
    end
  end

  def delete_student
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to '/admin/students', flash: { warning: 'Student was successfully deleted.' }
  end

  #-----------------------------------------------------------------------------------------------

  def teachers
    @teachers = Teacher.paginate(page: params[:page], per_page: 12)
    @teacher_new = Teacher.new
  end

  def create_teacher
    @teacher_new = Teacher.new(teacher_params)
    if @teacher_new.save
      redirect_to '/admin/teachers', flash: { success: 'Teacher was successfully created.' }
    else
      @teachers = Teacher.paginate(page: params[:page], per_page: 12)
      @alert_message = 'Failed to create teacher. Please check the form.'
      render :teachers
    end
  end

  def edit_teacher
    @teacher = Teacher.find(params[:id])
  end

  def update_teacher
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to '/admin/teachers', flash: { success: 'Teacher was successfully updated.' }
    else
      render :edit_teacher
    end
  end

  def delete_teacher
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to '/admin/teachers', flash: { warning: 'Teacher was successfully deleted.' }
  end

  #-----------------------------------------------------------------------------------------------

  def assigments
    @assigments = Assigment.paginate(page: params[:page], per_page: 12)
    @assigment_new = Assigment.new
  end

  def create_assigment
    @assigment_new = Assigment.new(assigment_params)
    if @assigment_new.save
      redirect_to '/admin/assigments', flash: { success: 'Assigment was successfully created.' }
    else
      @assigments = Assigment.paginate(page: params[:page], per_page: 12)
      @alert_message = 'Failed to create assigment. Please check the form.'
      render :assigments
    end
  end

  def edit_assigment
    @assigment = Assigment.find(params[:id])
  end

  def update_assigment
    @assigment = Assigment.find(params[:id])
    if @assigment.update(assigment_params)
      redirect_to '/admin/assigments', flash: { success: 'Assigment was successfully updated.' }
    else
      render :edit_assigment
    end
  end

  def delete_assigment
    @assigment = Assigment.find(params[:id])
    @assigment.destroy
    redirect_to '/admin/assigments', flash: { warning: 'Assigment was successfully deleted.' }
  end
  
  private

  def student_params
    params.require(:student).permit(:name, :last_name, :email, :account, :group, :grade)
  end

  def teacher_params
    params.require(:teacher).permit(:name, :last_name, :email, :account)
  end
  
  def assigment_params
    params.require(:assigment).permit(:name)
  end

end
  