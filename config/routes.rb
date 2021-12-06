Rails.application.routes.draw do

  #Main Page
  get '/', to: 'welcome#index'

  #Parent Directory
  get '/parents', to: 'parents#index'

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

  #Vehicles
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/new', to: 'vehicles#new'
  get '/vehicles/:id', to: 'vehicles#show'
  post '/vehicles', to: 'vehicles#create'
  get '/vehicles/:id/edit', to: 'vehicles#edit'
  patch '/vehicles/:id', to: 'vehicles#update'
  delete '/vehicles/:id', to: 'vehicles#destroy'

end
