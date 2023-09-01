Rails.application.routes.draw do
  
  resources :admins  
  resources :students
  resources :teachers
  
  root 'pages#home'

  get '/admin', to: 'admins#home'
  get '/admin/students', to: 'admins#students'
  get '/admin/students/:id/edit', to: 'admins#edit_student', as: 'edit_admin_student'
  post '/admin/create_student', to: 'admins#create_student'
  delete '/admin/students/:id', to: 'admins#delete_student', as: 'delete_admin_student'
  patch '/admin/students/:id', to: 'admins#update_student', as: 'update_admin_student'

  get '/admin/teachers', to: 'admins#teachers'
  get '/admin/teachers', to: 'admins#teachers'
  get '/admin/teachers/:id/edit', to: 'admins#edit_teacher', as: 'edit_admin_teacher'
  post '/admin/create_teacher', to: 'admins#create_teacher'
  delete '/admin/teachers/:id', to: 'admins#delete_teacher', as: 'delete_admin_teacher'
  patch '/admin/teachers/:id', to: 'admins#update_teacher', as: 'update_admin_teacher'


  get '/admin/assignments', to: 'admins#assignments'

end
