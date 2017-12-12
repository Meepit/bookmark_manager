require 'sinatra/base'
require_relative './models/link'

class Bookmark < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:links)
  end

end
