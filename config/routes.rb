Rails.application.routes.draw do
  devise_for :headhunterusers
  root to: 'home#index'
end
