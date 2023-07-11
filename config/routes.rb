Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # Defines the locale scope
  scope '(:locale)', locale: /en|pt-BR|es/ do
    # Defines the root path route ("/")
    resources :champions, only: [:index, :show]
    resources :recommendations, only: [:create, :new, :show, :update]
    get 'champions/word_cloud/:position', to: 'champions#word_cloud', as: 'champions_word_cloud'
    root 'application#home'
  end
end
