Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the locale scope
  scope '(:locale)', locale: /en|pt-BR|es/ do
    # Defines the root path route ("/")
    root 'application#home'
  end
  get 'inicio' => 'welcome#index'
end
