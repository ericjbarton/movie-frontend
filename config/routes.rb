Rails.application.routes.draw do
  defaults format: :json do
    get "/movies" => "movie#index"
    post "/movies" => "movies#create"
    get "/movies/:id" => "movies#show"
    patch "/movies/:id" => "movies#update"
    delete "/posts/:id" => "posts#destroy"
  end
end
