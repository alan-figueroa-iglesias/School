class StudentsController < ApplicationController     
        
  def destroy
    @student = Student.find params[:id]
    @student.destroy
    redirect_to '/admin/students', flash: { warning: 'Student was successfully deleted.' }
  end    
  
end
