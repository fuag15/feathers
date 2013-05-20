Feathers::Application.routes.draw do
  # session control
  devise_for :users

  # allow easy sign in
  devise_scope :user do
    get "login", to: "devise/sessions#new"
  end

  # base resource routes
  resources :addresses, :jobs, :job_categories, :packages, :pictures, :posts, :projects, :project_categories, :resume_categories, :resume_entries

  # posts jobs and projects have pictures
  resources :posts, :jobs, :projects do
    resources :pictures
  end

  # projects have packages
  resources :projects do
    resources :packages
  end

  # job categories have jobs
  resources :job_categories do
    resources :jobs
  end

  # project categories have projects
  resources :project_categories do
    resources :projects
  end

  # resume categories have resume entries
  resources :resume_categories do
    resources :resume_entries
  end

  # map resume to placeholder resumes controller index
  match 'resume', to: 'resumes#index'

  # map contact to resume index
  match 'contact', to: 'contact#index'

  # map submit to contact submit
  match 'submit', to: 'contact#submit'

  # we want posts#index to be our landing page
  root to: 'posts#index'
end
