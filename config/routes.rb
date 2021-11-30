Rails.application.routes.draw do
  get '/welcome', to: 'welcome#index'
  get '/', to: 'welcome#example'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
