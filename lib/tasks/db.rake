namespace :db do
  desc "Load from SQL file to the database"
  task :load => :environment do
    db_config = ActiveRecord::Base.configurations[Rails.env]
    file = Dir[File.join(Rails.root, "db", "backup", "*.sql")].first
    host_or_socket = db_config.has_key?('host') ? "-h #{db_config['host']}" : "-S #{db_config['socket']}"
    raise "Please specify FILE." unless file
    command = ''
    command << "mysql #{host_or_socket} -u #{db_config['username']} #{'-p' if db_config['password']}#{db_config['password']} #{db_config['database']}"
    command << " < #{file}"
    sh command
  end
end
