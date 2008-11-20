require 'deprec'
  
set :database_yml_in_scm, false

set :user, "fred"
set :runner, "fred"  
set :application, "postcards"
set :domain, "173.45.229.127"
# set :gems_for_project, %w(dr_nic_magic_models swiftiply) # list of gems to be installed
set :repository, "git@github.com:fredhersch/postcards.git"
set :scm, :git
set :deploy_via, :remote_cache
role :app, domain
role :web, domain
role :db, domain, :primary => true

# If you aren't deploying to /var/www/apps/#{application} on the target
# servers (which is the deprec default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    top.deprec.mongrel.restart
  end
end