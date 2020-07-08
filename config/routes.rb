Rails.application.routes.draw do
  devise_for :applicantusers
  devise_for :headhunterusers

  root to: 'home#index'

  resources :jobs

  resources :applicants

  get '/meu-perfil', to: 'applicants#profile'
end
