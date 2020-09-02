Rails.application.routes.draw do
	root 'tests#index'
  resources :statements
  resources :answers
  resources :questions
  resources :tests
  resources :tcategories
  resources :survey
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
