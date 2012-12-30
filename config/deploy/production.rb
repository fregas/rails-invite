
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

namespace(:customs) do
  task :symlink_gems, :roles => :app do
    run <<-CMD
      ln -fs  #{deploy_to}shared/gems #{deploy_to}current/vendor/gems
    CMD
    # ln -nfs /home/fregas/apps/reviewsome/shared/gems/ /home/fregas/apps/reviewsome/current/vendor/gems/
    #                                                   /home/fregas/apps/reviewsome/current/vendor/gems/
  end

  task :bundler, :roles => :app do
    run <<-CMD
      bundle install --gemfile #{deploy_to}current/Gemfile --path #{deploy_to}shared/gems/
    CMD
  end
end

#after "deploy:symlink","customs:symlink_gems"
#after "deploy:symlink", "customs:bundler"




