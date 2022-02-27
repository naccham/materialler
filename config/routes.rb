Rails.application.routes.draw do
  
  devise_for :admin, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations'}
  devise_for :user, controllers: { sessions: 'public/sessions', registrations: 'public/registrations'}

  root to: 'public/homes#top'
  namespace :admin do
    resources :sites, except: [:new]
    resources :tags, only: [:index, :new, :create, :edit, :update]
    resources :users, only: [:show, :index, :edit, :update]
  end
  
  scope module: :public do
    resources :sites, only: [:show, :index]
    resources :users, only: [:show, :edit, :update]
  end
  
  
end
