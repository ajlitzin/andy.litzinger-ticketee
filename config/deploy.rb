require 'bundler/capistrano'
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
set :rvm_type, :user
require 'rvm/capistrano'

set :application, "ticketee"
set :repository,  "git@github.com:ajlitzin/andy.litzinger-ticketee.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :port, 2222

role :web, "localhost"
role :app, "localhost"
role :db,  "localhost", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "vagrant"
set :deploy_to, "/home/vagrant/sites/#{application}"
set :use_sudo, false
set :keep_releases, 5

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

# task :symlink_database_yml do
#   run "rm #{release_path}/config/database.yml"
#   run "ln -sfn #{shared_path}/config/database.yml #{release_path}/config/database.yml"
# end
# before "deploy:assets:precompile", "bundle:install"
# after "bundle:install", "symlink_database_yml"
