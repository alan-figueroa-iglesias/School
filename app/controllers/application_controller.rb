class ApplicationController < ActionController::Base
    helper_method :current_user
  
    def current_user
      @current_user ||= begin
        if session[:user_id]
          # Intenta buscar el usuario en cada uno de los modelos sin importar el tipo
          user = Admin.find_by(id: session[:user_id]) ||
                 Student.find_by(id: session[:user_id]) ||
                 Teacher.find_by(id: session[:user_id])
          
          user if user.present? # Retorna el usuario si se encontró, de lo contrario, será nil
        end
      end
    end
  end
  