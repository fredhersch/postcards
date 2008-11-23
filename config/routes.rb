ActionController::Routing::Routes.draw do |map|
  map.resources :categories

  map.resources :links

  # change to route to make comments under postcards
  # http://url/postcards/postcard-id/comments/ 
  map.resources :tags
  map.resources :postcards, :has_many => :votes
  map.resources :postcards, :has_many => :comments
  
  map.namespace :admin do |admin|
    admin.resources :postcards
  end
  
  map.about '/about', :controller => "postcards", :action => 'about'
  # Restful Authentication Rewrites
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.change_password '/change_password/:reset_code', :controller => 'passwords', :action => 'reset'
  map.open_id_complete '/opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create '/opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }
  
  # Restful Authentication Resources
  map.resources :users
  map.resources :passwords
  map.resource :session
  
  #Search route
  map.search "search", :controller => "search"
  
  # Home Page
  map.root :controller => 'postcards', :action => 'index'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
