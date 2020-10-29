Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
	root 'pages#wellcome'
	
  resources :statements do 
  	get 'update_certificate', on: :member
  end
  resources :answers
  resources :questions
  resources :tests
  resources :tcategories
  resources :survey
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
