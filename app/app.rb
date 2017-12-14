require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base
  # Default env should be dev unless explicitly changed
  ENV["RACK_ENV"] ||= "development"

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    link.add_tags(params[:tags])
    link.save
    redirect '/links'
  end

  post '/tag-filters' do
    redirect("/tag/#{params[:tag]}")
  end

  get '/tag/:tag' do |t|
    @links = Tag.get_links_by_tag(t)
    erb(:link_filter)
  end

  run! if app_file == $0
end
