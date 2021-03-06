ActionController::Routing::Routes.draw do |map|
  map.resources :categories

   
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
  
  # Content Rewrites
  map.about '/about', :controller => "content", :action => 'about'
  map.admin '/admin', :controller => "content", :action => 'admin'
  map.contact '/contact', :controller => "content", :action => 'contact'
  map.editor '/editor', :controller => "content", :action => 'editor'
  
  # Restful Authentication Resources
  map.resources :users do |users|
     users.resources :roles
   end
  map.resources :passwords
  map.resource :session
  map.resources :copyrights
  map.resources :votes
  map.resources :works
  
  # Home Page
  map.root :controller => 'content', :action => 'front'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
