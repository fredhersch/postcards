#############################################################
#	Application
#############################################################

set :application, "postcards"
set :deploy_to, "/home/fred/public_html/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:paranoid] = false
set :use_sudo, true
set :scm_verbose, true
set :rails_env, "production" 
#set :mongrel_conf = "#{current_path}/config/mongrel_conf.yml"


#############################################################
#	Servers
#############################################################

set :user, "fred"
set :runner, "fred"
set :domain, "173.45.229.127"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, :git
set :branch, "origin/master"
set :scm_user, 'fredhersch'
set :scm_passphrase, "herschy"
set :repository, "git clone git@github.com:fredhersch/postcards.git"
set :deploy_via, :remote_cache

#############################################################
#	Passenger
#############################################################

namespace :deploy do
  desc "Create the database yaml file"
  task :after_update_code do
    db_config = <<-EOF
    production:    
      adapter: mysql
      encoding: utf8
      username: fred
      password: dbAdm1n
      database: postcards_production
      host: localhost
    EOF
    
    put db_config, "#{release_path}/config/database.yml"
    
    #########################################################
    # Uncomment the following to symlink an uploads directory.
    # Just change the paths to whatever you need.
    #########################################################
    
    desc "Symlink the upload directories"
     task :before_symlink do
       run "mkdir -p #{shared_path}/uploads"
       run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
     end
  end
    
  # Restart passenger on deploy
  # Commented out as not using passenger
  # desc "Restarting mod_rails with restart.txt"
  #task :restart, :roles => :app, :except => { :no_release => true } do
  #  run "touch #{current_path}/tmp/restart.txt"
  #end
  
  #[:start, :stop].each do |t|
  #  desc "#{t} task is a no-op with mod_rails"
  #  task t, :roles => :app do ; end
  #end
  # desc "restart mongrel"
  # task :restart, :roles => :app, :except => { :no_release => true } do
  #    top.deprec.mongrel.restart
  #end
  
end
