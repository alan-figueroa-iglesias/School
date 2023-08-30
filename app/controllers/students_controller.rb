class StudentsController < ApplicationController
    

    def index   # Consulta y almacena toda la info de la bd en la variable @student
        @students = Student.all 
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to @student, notice: 'Student added successfully'
        else
            render "students/new" # renderiza app/views/products/index.html.erb
        end
    end
      
      
    private
    def student_params
        params.require(:student).permit(:photo, :name, :last_name, :email, :password, :account, :group, :grade)
    end
end
