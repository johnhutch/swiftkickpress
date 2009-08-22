set :stages, %w(staging production)
set :default_stage, "production"
require File.expand_path("#{File.dirname(__FILE__)}/../vendor/gems/capistrano-ext-1.2.1/lib/capistrano/ext/multistage")

set :user, 'swiftkickpress'  # Your dreamhost account's username
set :domain, 'swiftkickpress.com'  # Dreamhost servername where your account is located 
set :project, 'swiftkickpress'  # Your application as its called in the repository
set :application, 'swiftkickpress'  # Your app's location (domain or sub-domain name as setup in panel)
set :applicationdir, "/home/#{user}/#{application}"  # The standard Dreamhost setup

# version control config
set :scm, 'git'
set :repository,  "git clone git@github.com:johnhutch/swiftkickpress.git"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true

# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

desc "restart override"
task :restart, :roles => :app do
  run "killall -9 ruby"
end

task :after_symlink do
  %w[database.yml].each do |c|
    run "ln -nsf #{shared_path}/system/config/#{c} #{current_path}/config/#{c}"
  end
  run "ln -nsf #{shared_path}/uploads/avatars #{current_path}/public/avatars"
  run "ln -nsf #{shared_path}/uploads/illustrations #{current_path}/public/illustrations"
  run "ln -nsf #{shared_path}/uploads/works #{current_path}/public/works"
end

namespace :db do
  desc 'Dumps the production database to db/production_data.sql on the remote server'
  task :remote_db_dump, :roles => :db, :only => { :primary => true } do
    run "cd #{deploy_to}/#{current_dir} && " +
      "rake RAILS_ENV=#{rails_env} db:database_dump --trace" 
  end

  desc 'Downloads db/production_data.sql from the remote production environment to your local machine'
  task :remote_db_download, :roles => :db, :only => { :primary => true } do  
    execute_on_servers(options) do |servers|
      self.sessions[servers.first].sftp.connect do |tsftp|
        tsftp.download!("#{deploy_to}/#{current_dir}/db/production_data.sql", "db/production_data.sql")
      end
    end
  end

  desc 'Cleans up data dump file'
  task :remote_db_cleanup, :roles => :db, :only => { :primary => true } do
    execute_on_servers(options) do |servers|
      self.sessions[servers.first].sftp.connect do |tsftp|
        tsftp.remove! "#{deploy_to}/#{current_dir}/db/production_data.sql" 
      end
    end
  end 

  desc 'Dumps, downloads and then cleans up the production data dump'
  task :remote_db_runner do
    remote_db_dump
    remote_db_download
    remote_db_cleanup
  end
end