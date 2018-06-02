Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  get 'my_articles', to: 'pages#my_articles'


  # routes of articles
  resources :articles do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]

  get 'home_articles', to: 'pages#home_articles', as: 'home_articles'

  get 'articles/:id/likes', to: 'articles#likes', as: :likes
  get 'articles/:id/reviews/:id/likes', to: 'reviews#likes', as: :likes_review




    # member do                             # member => article id in URL
    #   get 'url_data', to: "articles#url_data"  # ArticlesController#url_data
    # end
  # end

  # routes of reviews

end
