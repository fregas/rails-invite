set :stages, %w(production)
require 'capistrano/ext/multistage'
set :use_sudo, false

set :application, 'craigisgraduating'

set :repository, "git@bitbucket.org:fregas/craigisgraduating-dev.git"

set :deploy_via, :remote_cache
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :synchronous_connect, true

default_run_options[:pty] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :link_files do
    #run "rm -Rf #{current_path}/files"
    run "ln -nfs #{deploy_to}shared/development.sqlite3 #{current_path}/db/development.sqlite3"
    #run "ln -nfs #{deploy_to}shared/videos/flash/ #{current_path}/public/videos/flash"
  end
end

after "deploy:create_symlink", "deploy:link_files"
after "deploy", "deploy:cleanup"
after "deploy:migrate", "deploy:cleanup"
