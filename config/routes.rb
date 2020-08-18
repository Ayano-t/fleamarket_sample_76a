Rails.application.routes.draw do
  root 'items#index'
  
  resources :items, only: [:index, :show]
  resources :categories

  # resources :images do
  #   member do
  #     get 'show_image'
  #   end
  # end

end
