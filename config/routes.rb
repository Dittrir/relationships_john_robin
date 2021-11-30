Rails.application.routes.draw do
  get '/parents', to: 'parents#index'
  get '/', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
