#############################################################
#	Application
#############################################################

set :application, "postcards"
set :deploy_to, "/home/deploy/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, true
set :scm_verbose, true
set :rails_env, "production" 

#############################################################
#	Servers
#############################################################

set :user, "deploy"
set :runner, "deploy"
set :domain, "173.45.229.127"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, :git
set :branch, "master"
set :scm_user, 'fredhersch'
set :scm_passphrase, "herschy"
set :repository, "git@github.com:fredhersch/postcards.git"
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
      username: deploy
      password: postcard
      database: postcards_production
      host: localhost
    EOF
    
    put db_config, "#{release_path}/config/database.yml"
    
    #########################################################
    # Uncomment the following to symlink an uploads directory.
    # Just change the paths to whatever you need.
    #########################################################
    
  desc "Fix script permissions"
  task :fix_script_perms do
      run "chmod 755 #{latest_release}/script/spin"
    end
    
  desc "Symlink the upload directories"
   task :before_symlink do
     run "mkdir -p #{shared_path}/uploads"
     run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
  end
  
  end
    
  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
  
end
