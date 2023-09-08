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
    TeacherAssignment.where(teacher_id: @teacher).destroy_all
    @teacher.destroy
    redirect_to '/admin/teachers', flash: { warning: 'Teacher was successfully deleted.' }
  end

  #-----------------------------------------------------------------------------------------------

  def assignments
    @assignments = Assignment.paginate(page: params[:page], per_page: 12)
    @assignment_new = Assignment.new
  end

  def create_assignment
    @assignment_new = Assignment.new(assignment_params)

    if params[:assignment][:group].present?
      group = params[:assignment][:group].join(' ')
    else
      @alert_message = 'Failed'
    end
    
    @assignment_new.group = group  
    if @assignment_new.save
      redirect_to '/admin/assignments', flash: { success: 'Assignment was successfully created.' }
    else
      @assignments = Assignment.paginate(page: params[:page], per_page: 12)
      @alert_message = 'Failed to create assignment. Please check the form.'
      render :assignments
    end
  end

  def edit_assignment
    @assignment = Assignment.find(params[:id])
  end

  def update_assignment
    @assignment = Assignment.find(params[:id])
  
    if params[:assignment].key?(:group)
      @assignment.update(group: params[:assignment][:group].join(' '))
  
      if @assignment.update(assignment_params)
        redirect_to '/admin/assignments', flash: { success: 'Assignment was successfully updated.' }
      else
        @alert_message = 'Please insert at name assignment.'
        render :edit_assignment
      end
    else
      @alert_message = 'Please select at least one group.'
      render :edit_assignment
    end
  end
  

  def delete_assignment
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to '/admin/assignments', flash: { warning: 'Assignment was successfully deleted.' }
  end

  #-----------------------------------------------------------------------------------------------

  def teacher_assignments
    # Encuentra al maestro por su nombre, por ejemplo, "Carlos"
    teacher = Teacher.find_by(name: "Manuel")
    @name_teacher = teacher.name

    if teacher
      # Obtén todas las asignaturas que imparte el maestro Carlos
      @assignments = teacher.teacher_assignments
    else
      # Maneja el caso en el que el maestro no se encuentra
      @assignments = []
    end
  end

  
  private

  def student_params
    params.require(:student).permit(:name, :last_name, :email, :password, :account, :grade, :group)
  end

  def teacher_params
    params.require(:teacher).permit(:name, :last_name, :email, :password, :account)
  end
  
  def assignment_params
    params.require(:assignment).permit(:name, :grade, :group)
  end
  

end
  