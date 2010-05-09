# encoding: utf-8

#require 'ftools' # does not exist for Ruby 1.9
require 'fileutils'

desc "Configure PostgreSQL"
task :postgresql do
  File.copy('config/database-postgresql.yml','config/database.yml')
  STDOUT.puts " * PostgreSQL database 'lportal' configured for user 'lportal', password 'lportal'"
end

desc "Configure MySQL"
task :mysql do
  File.copy('config/database-mysql.yml','config/database.yml')
  STDOUT.puts " * MySQL database 'lportal' configured for user 'lportal', password 'lportal'"
end
