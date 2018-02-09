Rails.application.routes.draw do
  get 'docs/index'
  get 'questions/hide', :to => 'questions#hide'

  resources :questions

  root 'docs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
