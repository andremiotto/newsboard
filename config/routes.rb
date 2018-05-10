Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  # routes of articles that belongs to a user. PRECISA DE USER_ARTICLES_PATH
  resources :users do
    resources :articles
  end

  # routes of articles
  resources :articles

  # routes of reviews
  resources :reviews

end
