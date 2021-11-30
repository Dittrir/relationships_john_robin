Rails.application.routes.draw do
  get '/', to: 'welcome#example'
  
  get '/parents', to: 'parents#index'
end
