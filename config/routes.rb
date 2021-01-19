Rails.application.routes.draw do
  resources :songs
  # root '/songs', to: 'song#index', as: root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
