Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_product" => "products#product"
    get "/health_potion" => "products#health_potion"
    get "/mana_potion" => "products#mana_potion"
  end
end
