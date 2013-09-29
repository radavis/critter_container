CritterContainer::Application.routes.draw do
  resources :pictures

  devise_for :users
  # devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  resources :pictures do
    resources :votes
  end

  root 'pictures#index'
end
