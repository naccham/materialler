Rails.application.routes.draw do

  devise_for :admin, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations'}
  devise_for :user, controllers: { sessions: 'public/sessions', registrations: 'public/registrations'}

  root to: 'public/homes#top'

  namespace :admin do
    resources :sites, except: [:new]
    resources :tags, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :tags do
    get 'sites', to: 'sites#search'end
    resources :users, only: [:show, :index, :edit, :update]
  end

  scope module: :public do
    resources :sites, only: [:index, :show] do
      get :search, on: :collection
      resources :comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    resources :tags, only: [:show, :index] do
      get :search, on: :collection
    end
    resources :contacts, only: [:new, :create]
    post 'contact/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contact/back', to: 'contact#back', as: 'back'
    get 'thanks', to: 'contact#thanks', as: 'thanks'
  end


end
