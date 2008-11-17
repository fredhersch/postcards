#############################################################
# Application
#############################################################
  
set :application, "APPNAME"
set :deploy_to, "/home/deploy/#{application}"

#############################################################
# Settings
#############################################################
 11.  
 12. default_run_options[:pty] = true
 13. ssh_options[:forward_agent] = true
 14. set :use_sudo, true
 15. set :scm_verbose, true
 16.  
 17. #############################################################
 18. # Servers
 19. #############################################################
 20.  
 21. set :user, "USERNAME"
 22. set :user_passphrase, "PASSWORD"
 23. set :domain, "DOMAIN"
 24. server domain, :app, :web
 25. role :db, domain, :primary => true
 26.  
 27. #############################################################
 28. # Git
 29. #############################################################
 30.  
 31. set :scm, :git
 32. set :branch, "master"
 33. set :scm_user, "GITUSERNAME"
 34. set :scm_passphrase, "GITPASSWORD"
 35. set :repository, "REPO"
 36. set :deploy_via, :remote_cache
 37.  
 38. #############################################################
 39. # Slicehost Setup
 40. #############################################################
 41.  
 42. namespace :slicehost do
 43.   desc "Setup Environment"
 44.   task :setup_env do
 45.     update_apt_get
 46.     install_dev_tools
 47.     install_git
 48.     install_sqlite3
 49.     install_rails_stack
 50.     install_apache
 51.     install_passenger
 52.     config_passenger
 53.     config_vhost
 54.   end
 55.   
 56.   desc "Update apt-get sources"
 57.   task :update_apt_get do
 58.     sudo "apt-get update"
 59.   end
 60.   
 61.   desc "Install Development Tools"
 62.   task :install_dev_tools do
 63.     sudo "apt-get install build-essential -y"
 64.   end
 65.   
 66.   desc "Install Git"
 67.   task :install_git do
 68.     sudo "apt-get install git-core git-svn -y"
 69.   end
 70.   
 71.   desc "Install Subversion"
 72.   task :install_subversion do
 73.     sudo "apt-get install subversion -y"
 74.   end
 75.   
 76.   desc "Install MySQL"
 77.   task :install_mysql do
 78.     sudo "apt-get install mysql-server libmysql-ruby -y"
 79.   end
 80.   
 81.   desc "Install PostgreSQL"
 82.   task :install_postgres do
 83.     sudo "apt-get install postgresql libpgsql-ruby -y"
 84.   end
 85.   
 86.   desc "Install SQLite3"
 87.   task :install_sqlite3 do
 88.     sudo "apt-get install sqlite3 libsqlite3-ruby -y"
 89.   end
 90.   
 91.   desc "Install Ruby, Gems, and Rails"
 92.   task :install_rails_stack do
 93.     [ "sudo apt-get install ruby ruby1.8-dev irb ri rdoc libopenssl-ruby1.8 -y",
 94.       "mkdir -p src",
 95.       "cd src",
 96.       "wget http://rubyforge.org/frs/download.php/38646/rubygems-1.2.0.tgz",
 97.       "tar xzvf rubygems-1.2.0.tgz",
 98.       "cd rubygems-1.2.0/ && sudo ruby setup.rb",
 99.       "sudo ln -s /usr/bin/gem1.8 /usr/bin/gem",
100.       "sudo gem update --system",
101.       "sudo gem install rails --no-ri --no-rdoc"
102.     ].each {|cmd| run cmd}
103.   end
104.   
105.   desc "Install MySQL Rails Bindings"
106.   task :install_mysql_bindings do
107.     sudo "aptitude install libmysql-ruby1.8"
108.   end
109.   
110.   desc "Install ImageMagick"
111.   task :install_imagemagick do
112.     sudo "apt-get install libxml2-dev libmagick9-dev imagemagick"
113.     sudo "gem install rmagick"
114.   end
115.   
116.   desc "Install Apache"
117.   task :install_apache do
118.     sudo "apt-get install apache2 apache2.2-common apache2-mpm-prefork
119.           apache2-utils libexpat1 apache2-prefork-dev libapr1-dev -y"
120.     sudo "chown :sudo /var/www"
121.     sudo "chmod g+w /var/www"
122.   end
123.   
124.   desc "Install Passenger"
125.   task :install_passenger do
126.     run "sudo gem install passenger --no-ri --no-rdoc"
127.     input = ''
128.     run "sudo passenger-install-apache2-module" do |ch,stream,out|
129.       next if out.chomp == input.chomp || out.chomp == ''
130.       print out
131.       ch.send_data(input = $stdin.gets) if out =~ /(Enter|ENTER)/
132.     end
133.   end
134.   
135.   desc "Configure Passenger"
136.   task :config_passenger do
137.     passenger_config =<<-EOF
138. LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-2.0.3/ext/apache2/mod_passenger.so
139. PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-2.0.3
140. PassengerRuby /usr/bin/ruby1.8    
141.     EOF
142.     put passenger_config, "src/passenger"
143.     sudo "mv src/passenger /etc/apache2/conf.d/passenger"
144.   end
145.   
146.   desc "Configure VHost"
147.   task :config_vhost do
148.     vhost_config =<<-EOF
149.     <VirtualHost *:80>
150.       ServerName YOURSITEADDRESS
151.       DocumentRoot #{deploy_to}/current/public
152.     </VirtualHost>
153.     EOF
154.     put vhost_config, "src/vhost_config"
155.     sudo "mv src/vhost_config /etc/apache2/sites-available/#{application}"
156.     sudo "a2ensite #{application}"
157.     sudo "sudo a2enmod rewrite"
158.   end
159.   
160.   desc "Reload Apache"
161.   task :apache_reload do
162.     sudo "/etc/init.d/apache2 reload"
163.   end
164. end
165.  
#############################################################
# Deploy for Passenger
#############################################################
  
namespace :deploy do
   
desc "Restarting mod_rails with restart.txt"
task :restart, :roles => :app, :except => { :no_release => true } do
run "touch #{current_path}/tmp/restart.txt"
end
 
[:start, :stop].each do |t|
 desc "#{t} task is a no-op with mod_rails"
   task t, :roles => :app do ; end
  end
end

