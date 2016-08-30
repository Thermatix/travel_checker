Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    post '/api/calculate_travel', to: "api#calculate_travel"

  root "main#index"
end
