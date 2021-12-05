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
  post '/autoshops', to: 'autoshops#create'
  get '/autoshops/:id/edit', to: 'autoshops#edit'
  patch '/autoshops/:id', to: 'autoshops#update'

  #Vehicles
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/new', to: 'vehicles#new'
  get '/vehicles/:id', to: 'vehicles#show'

end
