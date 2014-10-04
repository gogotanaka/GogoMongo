require "gogo_mongo/version"

class GogoMongo
  require 'mongo'

  def client
    @_client = Mongo::Connection.new
  end

  class ::Mongo::DB
    def method_missing(method, *args, &block)
      send(:[], method)
    end
  end
end
