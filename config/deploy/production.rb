server "178.128.160.107", user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, "project-red-store"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, "production"
set :rails_env,   "production"

set :nginx_server_name, "178.128.160.107"
set :puma_conf, "#{shared_path}/config/puma.rb"