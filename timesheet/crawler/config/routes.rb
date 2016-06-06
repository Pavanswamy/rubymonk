Rails.application.routes.draw do
  resources :projects
  devise_for :users
  get 'assign_projects/index'
  root 'assign_projects#index'

  get :time_entry, to: "assign_projects#time_entry"
  get :users, to: "assign_projects#users"
  get :assign_memeber, to: "assign_projects#assign_memeber"
  post :create_project_members, to: "assign_projects#create_project_members"
  get :show_weeks, to: "assign_projects#show_weeks"
  post :save_time_entries, to: "assign_projects#save_time_entries"
  get :show_project_members, to: "assign_projects#show_project_members"
  get :show_users_time_sheets, to: "assign_projects#show_users_time_sheets"
  get :approve_time_sheets, to: "assign_projects#approve_time_sheets"
  get :reject_time_sheets, to: "assign_projects#reject_time_sheets"

end
