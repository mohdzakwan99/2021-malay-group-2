Rails.application.routes.draw do
  get 'sessions/destroy'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      root 'static_pages#home', as: "home"
      get 'static_pages/help', as:"help"
      get "/signup", to: "users#new"
      post "/signup", to: "users#create"
      get "/login", to: "sessions#new"
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
      resources :users, only: %i(new create show)
  end
end
