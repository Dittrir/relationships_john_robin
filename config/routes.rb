Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  
  get '/parents', to: 'parents#index'

  get '/plumbershops', to: 'plumbershops#index'
  get '/plumbershops/:id', to: 'plumbershops#show'
  get '/plumbershops/new', to: 'plumbershops#new'

  get '/plumbers', to: 'plumbers#index'
end
