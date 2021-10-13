Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about"
  resource :books, only:[:new, :create, :index ,:show, :edit, :update, :destroy]
  resource :users, only:[:new, :create, :index, :show, :edit, :update]
end
