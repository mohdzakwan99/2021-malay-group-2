Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      root 'static_pages#home', as: "home"
      get 'static_pages/help', as:"help"
  end
end
