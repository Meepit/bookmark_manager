require 'sinatra/base'
require_relative 'data_mapper_setup'

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
    tag = Tag.create(name: params[:tags])
    link = Link.create(title: params[:title], url: params[:url])
    link.tags << tag
    link.save # Have to save after appending in a many-to-many relationship
    redirect '/links'
  end

  post '/tag-filters' do
    redirect("/tag/#{params[:tag]}")
  end

  get '/tag/:tag' do |t|
    @links = Tag.all(:name => t).links
    erb(:link_filter)
  end

  run! if app_file == $0
end
