Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  
  get '/parents', to: 'parents#index'

  get '/plumbershops', to: 'plumbershops#index'
  get '/plumbershops/new', to: 'plumbershops#new'
  get '/plumbershops/:id', to: 'plumbershops#show'
  get '/plumbershops/:id/plumbers', to: 'plumbershop_plumbers#index'
  post '/plumbershops', to: 'plumbershops#create'
  get '/plumbershops/:id/edit', to: 'plumbershops#edit'
  patch '/plumbershops/:id', to: 'plumbershops#update'
  delete '/plumbershops/:id', to: 'plumbershops#destroy'

  get '/plumbers', to: 'plumbers#index'
  get '/plumbers/:id', to: 'plumbers#show'
  get 'plumbershops/:id/plumbers/new', to: 'plumbers#new'
  post '/plumbers', to: 'plumbers#create'
  get '/plumbers/:id/edit', to: 'plumbers#edit'
  patch '/plumbers/:id', to: 'plumbers#update'
end
