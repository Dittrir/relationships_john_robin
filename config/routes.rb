Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  
  get '/parents', to: 'parents#index'

  get '/plumbingshops', to: 'plumbingshops#index'
  get '/plumbingshops/new', to: 'plumbingshops#new'
  post '/plumbingshops/', to: 'plumbingshops#create'
  
  get '/plumbers', to: 'plumbers#index'
end
