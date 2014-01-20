# The following is an example script for cap deploys that we use at my company
set :application, "ad-ops"

set :repository, "git@github.com:vmcbos/ad-ops.git"
set :scm, :git

set :stages, Dir.glob('config/deploy/*.rb').map { |f| File.basename(f).sub('.rb', '')}.compact
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :user, "vmc"
set :use_sudo, false

set :bundle_without, [:darwin, :development, :test, :profile]

# cap <environment> deploy -S skip_resque=false -S skip_resque_scheduler=true
set :skip_resque, fetch(:skip_resque, false) 
set :skip_resque_scheduler, skip_resque || fetch(:skip_resque_scheduler, false)  # skip_resque trumps skip_resque_scheduler

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_config, :roles => :app, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end
before "deploy:assets:precompile", "deploy:symlink_config"

namespace :scheduler do
  task :stop, :roles => :db do
    run("cd #{deploy_to}/current; PIDFILE=tmp/pids/resque_scheduler.pid RAILS_ENV=#{rails_env} #{rake} resque:stop_scheduler")
  end

  task :restart, :roles => :db do
    run("cd #{deploy_to}/current; PIDFILE=tmp/pids/resque_scheduler.pid BACKGROUND=yes RAILS_ENV=#{rails_env} #{rake} resque:restart_scheduler")
  end
end

namespace :god do  
  task :shutdown, :roles => :worker do
    run "#{god_cmd} signal #{rails_env}_adops QUIT"
    run "#{god_cmd} quit"
  end
  
  task :watch, :roles => :worker do
    run "#{god_cmd} -c #{current_path}/config/god/#{rails_env}.god"
  end
end

namespace :remote do
  desc "Run a task on a remote server."
  # example: bundle exec cap staging remote:rake_task task=some_task
  task :rake_task do
    run("cd #{deploy_to}/current; #{bundle_cmd} exec #{rake_cmd} #{ENV['task']} RAILS_ENV=#{rails_env}")  
  end  
end

namespace :branch do
  namespace :jobs do
    desc "Queue Inventory and PixelPackage Builds"
    task :builds do
      run "cd #{current_path}; RAILS_ENV=#{rails_env} #{bundle_cmd} exec script/rails runner \"InventoryBuild.schedule(InventoryBuild.create.id)\""
      run "cd #{current_path}; RAILS_ENV=#{rails_env} #{bundle_cmd} exec script/rails runner \"PixelPackage.schedule\""
    end
  end
end

#cleanup
after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
