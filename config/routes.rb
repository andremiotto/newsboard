Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  # routes of articles that belongs to a user. PRECISA DE USER_ARTICLES_PATH
  resources :users do
    resources :articles
  end

  # routes of articles
  resources :articles do
    resources :reviews, only: [:new, :create,:edit,:update]
  end

  get 'home_articles', to: 'pages#home_articles', as: 'home_articles'





    # member do                             # member => article id in URL
    #   get 'url_data', to: "articles#url_data"  # ArticlesController#url_data
    # end
  # end

  # routes of reviews

end
