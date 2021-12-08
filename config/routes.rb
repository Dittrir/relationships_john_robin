Rails.application.routes.draw do

  #Main Page
  get '/', to: 'welcome#index'
  
  #Parent Directory
  get '/parents', to: 'parents#index'
  
  #Plumbershops
  get '/plumbershops', to: 'plumbershops#index'
  get '/plumbershops/new', to: 'plumbershops#new'
  get '/plumbershops/:id', to: 'plumbershops#show'
  get '/plumbershops/:id/plumbers', to: 'plumbershop_plumbers#index'
  post '/plumbershops', to: 'plumbershops#create'
  get '/plumbershops/:id/edit', to: 'plumbershops#edit'
  patch '/plumbershops/:id', to: 'plumbershops#update'
  delete '/plumbershops/:id', to: 'plumbershops#destroy'
  delete '/plumbershops', to: 'plumbershops#destroy'
  
  #Plumbers
  get '/plumbers', to: 'plumbers#index'
  get '/plumbers/:id', to: 'plumbers#show'
  get '/plumbershops/:id/plumbers/new', to: 'plumbers#new'
  post '/plumbershops/:id/plumbers', to: 'plumbers#create'
  get '/plumbers/:id/edit', to: 'plumbers#edit'
  patch '/plumbers/:id', to: 'plumbers#update'
  delete '/plumbers/:id', to: 'plumbers#destroy'

  #Autoshops
  get '/autoshops', to: 'autoshops#index'
  get '/autoshops/new', to: 'autoshops#new'
  get '/autoshops/:id', to: 'autoshops#show'
  get '/autoshops/:autoshop_id/vehicles', to: 'autoshop_vehicles#index'
  get '/autoshops/:id/vehicles_table', to: 'vehicles#table'
  post '/autoshops', to: 'autoshops#create'
  get '/autoshops/:id/edit', to: 'autoshops#edit'
  patch '/autoshops/:id', to: 'autoshops#update'
  get  '/autoshops/:autoshop_id/vehicles_table/new', to: 'vehicles#new'
  delete '/autoshops/:id', to: 'autoshops#destroy'
  get '/autoshops/:id/vehicles/new', to: 'autoshop_vehicles#new'
  post '/autoshops/:id/vehicles', to: 'autoshop_vehicles#create'

  #Vehicles
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/new', to: 'vehicles#new'
  get '/vehicles/:id', to: 'vehicles#show'
  post '/vehicles', to: 'vehicles#create'
  get '/vehicles/:id/edit', to: 'vehicles#edit'
  patch '/vehicles/:id', to: 'vehicles#update'
  delete '/vehicles/:id', to: 'vehicles#destroy'
end
