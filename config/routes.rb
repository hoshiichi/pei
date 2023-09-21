Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  get 'spalas/:spala_id/likes' => 'likes#create'
  get 'spalas/:spala_id/likes/:id' => 'likes#destroy'
  resources :spalas do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'menu'
    end
  end
  
resources :perfumes

  root 'spalas#top'
  


end
