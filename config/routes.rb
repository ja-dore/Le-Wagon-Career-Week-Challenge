Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/museums', to: 'pages#museum' # to this page our new API must respond
end
