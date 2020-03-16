Rails.application.routes.draw do
  root to: "mushrooms#index"
  get "mushrooms/import" => "mushrooms#import"
  resources :mushrooms
end
