$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

require "rubygems"
require "artworker"
require "factory_girl_rails"
require "active_record"
require "active_record/version"
require "active_support"
require "pathname"

require File.dirname(__FILE__) + "/factories"

config = YAML::load(IO.read(File.dirname(__FILE__) + "/database.yml"))
ActiveRecord::Base.establish_connection(config["test"])

database_yml = File.expand_path("../database.yml", __FILE__)

if File.exists?(database_yml)
  active_record_configuration = YAML.load_file(database_yml)
  
  ActiveRecord::Base.configurations = active_record_configuration
  config = ActiveRecord::Base.configurations["test"]
  
  begin
    ActiveRecord::Base.establish_connection("test")
    ActiveRecord::Base.connection
  end
    
  ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))
  ActiveRecord::Base.default_timezone = :utc
  
  ActiveRecord::Base.silence do
    ActiveRecord::Migration.verbose = false    
    load(File.dirname(__FILE__) + "/schema.rb")
    load(File.dirname(__FILE__) + "/models.rb")
  end  
  
else
  raise "Please create #{database_yml} first to configure your database. Take a look at: #{database_yml}.sample"
end

def clean_database!
  models = [ArtistModels,ArtworkModels]
  models.each do |model|
    ActiveRecord::Base.connection.execute "DELETE FROM #{model.table_name}"
  end
end

clean_database!