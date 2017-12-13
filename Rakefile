require 'data_mapper'
require './app/app.rb'

namespace :db_management do # High level description of the environment, groups behaviour
  desc "Migrating models to database" # Describes the task
  task :migrate do # Actual task
    puts "Migrating!"
    DataMapper.auto_migrate!
  end

  desc "Upgrade models"
  task :upgrade do
    puts "Upgrading!"
    DataMapper.auto_upgrade!
  end
end

# rake -T displays tasks
