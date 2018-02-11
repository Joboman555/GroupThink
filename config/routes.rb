Rails.application.routes.draw do
  devise_for :users
  get 'docs/index'
  get 'questions/hide', :to => 'questions#hide'

  resources :comments
  resources :questions

  root 'docs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
