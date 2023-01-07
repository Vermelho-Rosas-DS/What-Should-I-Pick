Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # Defines the locale scope
  scope '(:locale)', locale: /en|pt-BR|es/ do
    resource :recommendations, only: [:create, :new, :show]
    root 'application#home'
    get 'inicio' => 'welcome#index'
  end
end
