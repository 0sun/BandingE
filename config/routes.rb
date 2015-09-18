Rails.application.routes.draw do
  devise_for :users
  root :to => "banding2#main"
  
  get ":controller(/:action(/:id))"
  post ":controller(/:action(/:id))"
end
