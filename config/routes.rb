CritterContainer::Application.routes.draw do

  resources :pictures do
    member do
      get "upvote"
      get "downvote"
    end
  end

  devise_for :users
  # devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  root 'pictures#index'
end
