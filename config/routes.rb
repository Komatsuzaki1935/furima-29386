Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'users/edit'
  delete 'users/sign_out'
end
