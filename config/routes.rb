Rails.application.routes.draw do
  root "movies#index"

  resources :characters
  resources :actors
  resources :directors
  resources :movies

  get ":movies/:id/duration/edit" => "movies#edit_duration"
  get ":movies/:id/year/edit" => "movies#edit_year"
  get ":movies/:id/title/edit" => "movies#edit_title"
  get ":movies/:id/description/edit" => "movies#edit_description"
  get ":movies/:id/director/edit" => "movies#edit_director"
end
