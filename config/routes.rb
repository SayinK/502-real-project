Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Public homepage
  root "home#index"

  # Admin authentication (Google OAuth only)
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
  
  # Admin dashboard (requires authentication)
  get 'dashboards/show', to: 'dashboards#show', as: :admin_dashboard
end