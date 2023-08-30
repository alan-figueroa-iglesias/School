Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  
  resources :teachers
  
  root 'pages#home'

  get '/admin', to: 'admins#home'
  get '/admin/students', to: 'admins#students'
  get '/admin/teachers', to: 'admins#teachers'
  get '/admin/assignments', to: 'admins#assignments'
  post '/admin/create_student', to: 'admins#create_student'

end
