Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/projects/:project_id/add_contestant', to: 'contestant_projects#create'
  get '/projects/:project_id', to: 'projects#show'

  get '/contestants', to: 'contestants#index'
end
