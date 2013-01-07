require "ostruct"

def info(message)
  Logger.new(STDOUT).info ">>>>> #{message}\n"
end

def run(command)
  raise "Failed to run command => #{command}" unless system command
end


%w(ci deploy db).each { |file| require File.expand_path(file, File.dirname(__FILE__)) }

APP = OpenStruct.new
APP.root = File.join(File.dirname(__FILE__), "..")

MYSQL = OpenStruct.new
MYSQL.root = OpenStruct.new
MYSQL.root.name = 'root'
MYSQL.root.password = '*****'

MYSQL.user = OpenStruct.new
MYSQL.user.name = '***'
MYSQL.user.password = '***'

MYSQL.db = OpenStruct.new
MYSQL.db.prod = 'computek'
MYSQL.db.test = 'computek_test'
MYSQL.db.dev = 'computek_development'

MYSQL.address = 'localhost'

