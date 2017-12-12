require 'sinatra/base'
require_relative './models/link'

class Bookmark < Sinatra::Base
  ENV["RACK_ENV"] ||= "development"

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

end
