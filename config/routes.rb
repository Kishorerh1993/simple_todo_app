Rails.application.routes.draw do
  resources :todos do 
    collection {get :completed}
    collection {get :active}
    member {get :mark_complete}
  end
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
