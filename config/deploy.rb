# config valid only for Capistrano 3.1
lock '3.18.0'

set :application, 'fiftypercent'
set :repo_url, 'git@github.com:rubymonsters/fiftypercent.git'
set :stage,           :production
set :deploy_via,      :remote_cache


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, ENV['BRANCH'] if ENV['BRANCH']

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/fiftypercent'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/secrets.yml}

# see: https://github.com/capistrano/bundler/issues/45
set :bundle_binstubs, nil

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/images}

# Default value for default_env is {}
set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# If you want to restart using `touch tmp/restart.txt`, add this to your config/deploy.rb:
set :passenger_restart_with_touch, true

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
