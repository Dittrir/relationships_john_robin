Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  
  get '/parents', to: 'parents#index'

  get '/plumbingshops', to: 'plumbingshops#index'
  get '/plumbingshops/:id', to: 'plumbingshops#show'
  get '/plumbingshops/new', to: 'plumbingshops#new'
  post '/plumbingshops/', to: 'plumbingshops#create'
  get '/plumbingshops/:id/edit', to: 'plumbingshops#edit'
  put '/plumbingshops/:id/update', to: 'plumbingshops#update'

  get '/plumbers', to: 'plumbers#index'
end
