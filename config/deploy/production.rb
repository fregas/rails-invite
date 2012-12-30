
set :use_sudo, false 
set :user, 'craigbowes'
set :password, 'shamino1!'
set :domain, 'enilon.com'

set :deploy_via, :remote_cache
set :deploy_to, "/home/craigbowes/craigisgraduating/"

#set :chmod755, "app config db lib public vendor script script/* public/disp*"
#set :group_writable, false
set :runner, user

role :app, domain
role :web, domain
role :db, domain, :primary => true


task :link_files do
  run "ln -nfs #{deploy_to}/shared/development.sqlite3 #{current_path}/db/development.sqlite3"
end

after "deploy:symlink","link_files"
#after "deploy:symlink", "customs:bundler"




