require "data_mapper"
require "dm-migrations"
require "dm-postgres-adapter"

class Link
  include DataMapper::Resource

  property :title,    String
  property :url,      String
  property :id,       Serial

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
