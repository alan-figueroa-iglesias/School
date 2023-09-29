class AdminsController < ApplicationController


  
  #-----------------------------------------------------------------------------------------------

  def students
    @students = Student.paginate(page: params[:page], per_page: 12)
    @student_new = Student.new
    generate_student_account
    generate_password
  end

  def generate_student_account
    if last_account = Student.maximum(:account)
      new_account = last_account + 1
      @account = new_account.to_i
    else
      year = Time.now.year
      reset = 0000
      @account = "#{year}#{reset.to_s.rjust(4, '0')}"
    end
  end

  def create_student
    @student_new = Student.new(student_params)
    if @student_new.save
      redirect_to '/admin/students', flash: { success: 'Student was successfully created.' }
    else
      @students = Student.paginate(page: params[:page], per_page: 12)
      redirect_to '/admin/students', flash: { alert: 'Failed to create student. Please check the form.' }
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
      redirect_to edit_admin_student_path(@student), flash: { alert: 'Failed to update student. Please try again.' }
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
    generate_teacher_account
    generate_password
  end

  def generate_teacher_account
    if last_account = Teacher.maximum(:account)
      new_account = last_account + 1
      #account_i = "#{new_account.to_s.rjust(4, '0')}"
      @account = new_account.to_i
    else
      @account = 20000000
    end
  end

  def create_teacher
    @teacher_new = Teacher.new(teacher_params)
    if @teacher_new.save
      redirect_to '/admin/teachers', flash: { success: "Teacher was successfully created. Password #{@password}" }
    else
      @teachers = Teacher.paginate(page: params[:page], per_page: 12)
      redirect_to '/admin/teachers', flash: { alert: 'Failed to create teacher. Please try again.' }
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
      redirect_to edit_admin_teacher_path(@teacher), flash: { alert: 'Failed to update teacher. Please try again.' }
    end
  end

  def delete_teacher
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    redirect_to '/admin/teachers', flash: { warning: 'Teacher was successfully deleted.' }
  end

  #-----------------------------------------------------------------------------------------------

  def assignments
    @assignments = Assignment.order(:name).paginate(page: params[:page], per_page: 12)
    @assignment_new = Assignment.new
  end
  

  def create_assignment
    @assignment_new = Assignment.new(assignment_params)

    if @assignment_new.save
      redirect_to '/admin/assignments', flash: { success: 'Assignment was successfully created.' }
    else
      @assignments = Assignment.paginate(page: params[:page], per_page: 12)
      redirect_to '/admin/assignments', flash: { alert: 'Failed to create assignment. Please check the form.' }
    end
  end

  def edit_assignment
    @assignment = Assignment.find(params[:id])
  end

  def update_assignment
    @assignment = Assignment.find(params[:id])
  
    if @assignment.update(assignment_params)
      redirect_to '/admin/assignments', flash: { success: 'Assignment was successfully updated.' }
    else
      redirect_to edit_admin_assignment_path(@assignment), flash: { alert: 'Please insert at name assignment.' }
    end
  end
  

  def delete_assignment
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to '/admin/assignments', flash: { warning: 'Assignment was successfully deleted.' }
  end

  #-----------------------------------------------------------------------------------------------

  def assignments_teachers
    @assignments_teachers = AssignmentTeachers.paginate(page: params[:page], per_page: 12)
    @assignment_teacher_new = AssignmentTeachers.new
  end

  def create_assignment_teacher
    @assignment_teacher_new = AssignmentTeachers.new(assignment_teacher_params)

    if params[:assignment_teacher][:group].present?
      group = params[:assignment_teacher][:group].join(' ')
    else
      redirect_to '/admin/assignments_teachers', flash: { alert: 'You must select at least one group' }
      return
    end

    existing_record = AssignmentTeachers.find_by(
      assignment_id: assignment_teacher_params[:assignment_id],
      teacher_id: assignment_teacher_params[:teacher_id],
      grade: assignment_teacher_params[:grade]
    )
  
    if existing_record
      redirect_to '/admin/assignments_teachers', flash: { alert: 'This class already exists' }
      return
    end
    
    @assignment_teacher_new.group = group  
    if @assignment_teacher_new.save
      redirect_to '/admin/assignments_teachers', flash: { success: 'Class was successfully created.' }
    else
      @assignments_teachers = AssignmentTeachers.paginate(page: params[:page], per_page: 12)
      redirect_to '/admin/assignments_teachers', flash: { alert: 'Failed to create class. Please check the form.' }
    end
  end

  def edit_assignment_teacher
    @assignment_teacher = AssignmentTeachers.find(params[:id])
  end

  def update_assignment_teacher
    @assignment_teacher = AssignmentTeachers.find(params[:id])
  
    if params[:assignment_teachers].present? && params[:assignment_teacher].present?
      assignment_id = params[:assignment_teachers][:assignment_id]
      teacher_id = params[:assignment_teachers][:teacher_id]
      grade = params[:assignment_teachers][:grade]
      group = params[:assignment_teacher][:group].join(' ')
  
      if @assignment_teacher.update(assignment_id: assignment_id, teacher_id: teacher_id, grade: grade, group: group)
        redirect_to '/admin/assignments_teachers', flash: { success: 'Class was successfully updated.' }
      else
        redirect_to '/admin/assignments_teachers', flash: { alert: 'Failed to create class. Please check the form.' }
      end
    else
      redirect_to edit_admin_assignment_teacher_path(@assignment_teacher), flash: { alert: 'You must select at least one group' }
    end
  end
  
  def delete_assignment_teacher
    @assignment_teacher = AssignmentTeachers.find(params[:id])
    @assignment_teacher.destroy
    redirect_to '/admin/assignments_teachers', flash: { warning: 'Class was successfully deleted.' }
  end
  
  private

  def generate_password(length = 8)
    characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    @password = ''
    length.times { @password << characters.sample }
    puts "---------- THE PASSWORD IS ---------- #{@password}"
    @password
  end

  def student_params
    params.require(:student).permit(:name, :last_name, :email, :password, :account, :grade, :group)
  end

  def teacher_params
    params.require(:teacher).permit(:name, :last_name, :email, :password, :account)
  end
  
  def assignment_params
    params.require(:assignment).permit(:name)
  end
  
  def assignment_teacher_params
    params.require(:assignment_teacher).permit(:assignment_id, :teacher_id, :grade, group: []) 
  end
   
end
  