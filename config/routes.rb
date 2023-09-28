Rails.application.routes.draw do
  
  resources :admins  
  resources :students
  resources :teachers
  resources :assigments
  
  root 'pages#home' 
  get '/student', to: 'students#home', as: 'student_dashboard'
  get '/teacher', to: 'teachers#home', as: 'teacher_dashboard'
  get '/admin', to: 'admins#home', as: 'admin_dashboard'

  get '/login', to: 'pages#login'
  post '/login', to: 'pages#login_session' # Ruta para el inicio de sesión (POST)
  delete '/logout', to: 'pages#destroy'

  get '/admin/students', to: 'admins#students'
  get '/admin/students/:id/edit', to: 'admins#edit_student', as: 'edit_admin_student'
  post '/admin/create_student', to: 'admins#create_student'
  delete '/admin/students/:id', to: 'admins#delete_student', as: 'delete_admin_student'
  patch '/admin/students/:id', to: 'admins#update_student', as: 'update_admin_student'

  get '/admin/teachers', to: 'admins#teachers'
  get '/admin/teachers/:id/edit', to: 'admins#edit_teacher', as: 'edit_admin_teacher'
  post '/admin/create_teacher', to: 'admins#create_teacher'
  delete '/admin/teachers/:id', to: 'admins#delete_teacher', as: 'delete_admin_teacher'
  patch '/admin/teachers/:id', to: 'admins#update_teacher', as: 'update_admin_teacher'

  get '/admin/assignments', to: 'admins#assignments'
  get '/admin/assignments/:id/edit', to: 'admins#edit_assignment', as: 'edit_admin_assignment'
  post '/admin/create_assignment', to: 'admins#create_assignment'
  delete '/admin/assignments/:id', to: 'admins#delete_assignment', as: 'delete_admin_assignment'
  patch '/admin/assignments/:id', to: 'admins#update_assignment', as: 'update_admin_assignment'

  get '/admin/assignments_teachers', to: 'admins#assignments_teachers'
  get '/admin/assignments_teachers/:id/edit', to: 'admins#edit_assignment_teacher', as: 'edit_admin_assignment_teacher'
  post '/admin/create_assignment_teacher', to: 'admins#create_assignment_teacher'
  delete '/admin/assignments_teachers/:id', to: 'admins#delete_assignment_teacher', as: 'delete_admin_assignment_teacher'
  patch '/admin/assignments_teachers/:id', to: 'admins#update_assignment_teacher', as: 'update_admin_assignment_teacher'
end
