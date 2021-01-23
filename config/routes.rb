Rails.application.routes.draw do

  resources :songs, only: [:show, :index, :edit, :create, :new, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
