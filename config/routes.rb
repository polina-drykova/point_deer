Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'posts#index'
  get 'admin', to: 'posts#admin'
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
