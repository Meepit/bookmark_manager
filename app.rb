require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/link'

class Bookmark < Sinatra::Base
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager")

  get '/home' do
    @database = DataMapper.finalize
    erb(:home)
  end

end
