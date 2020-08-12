Rails.application.routes.draw do
  root 'items#index'
  resourse :items, only: :index

end
