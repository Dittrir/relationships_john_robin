Rails.application.routes.draw do

  #Main Page
  get '/', to: 'welcome#index'

  #Parent Directory
  get '/parents', to: 'parents#index'

  #Autoshops
  get '/autoshops', to: 'autoshops#index'
  get '/autoshops/new', to: 'autoshops#new'
  get '/autoshops/:id', to: 'autoshops#show'
  get '/autoshops/:id/edit', to: 'autoshops#edit'

  #Vehicles
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/new', to: 'vehicles#new'
  get '/vehicles/:id', to: 'vehicles#show'
  get '/vehicles/:id/edit', to: 'vehicles#edit'

end
