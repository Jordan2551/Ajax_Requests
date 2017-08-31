Rails.application.routes.draw do

  resources :cities
  resources :countries
  #STUDENTS RESOURCES
  resources :students

  get 'search', to: 'students#search'
  get 'filter', to: 'students#filter'
  get 'students/filter_cities/:country', to: 'students#filter_cities'

  root 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
