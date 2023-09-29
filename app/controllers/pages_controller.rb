class PagesController < ApplicationController
    def home
    end

    def login
    end

    def login_session
        user = detect_user(params[:account])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            case user
            when Admin
                redirect_to admin_dashboard_path, flash: { success: 'Login was successfully.' }
            when Student
                redirect_to student_dashboard_path, flash: { success: 'Login was successfully.' }
            when Teacher
                redirect_to teacher_dashboard_path, flash: { success: 'Login was successfully.' }
            else
              # Si el tipo de usuario no es Admin, Student ni Teacher, maneja el caso aquí.
            end
            
        else
            @alert_message = 'Failed to login . Please check the info.'        
            render :login
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Sesión cerrada correctamente'
    end

    private

    def detect_user(account)
        admin = Admin.find_by(account: account)
        student = Student.find_by(account: account)
        teacher = Teacher.find_by(account: account)

        admin || student || teacher
    end
end
