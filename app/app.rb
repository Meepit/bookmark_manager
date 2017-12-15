require 'sinatra/base'
require_relative 'bookmark_helper'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Bookmark < Sinatra::Base
  include BookmarkHelper
  register Sinatra::Flash
  # Default env should be development unless explicitly changed
  ENV["RACK_ENV"] ||= "development"
  enable :sessions
  set :session_secret, 'probably not really that secret'

  get '/links' do
    @user_name = get_current_user.email if get_current_user
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_links)
  end

  get '/users/new' do
    #@failed = flash[:error]
    erb(:new_user)
  end

  post '/users' do
    # Need to salt and hash pw before creating user

     user = User.create(email: params[:email], password: params[:password],password_confirmation: params[:confirm])

    
    if user.save
      session[:user_name] = user.email
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.next[:email] = params[:email]
      flash.next[:error] = user.errors.full_messages.join(" ")
      redirect '/users/new'
    end
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    link.add_tags(params[:tags])
    redirect '/links'
  end

  post '/tag-filter' do
    redirect("/tag/#{params[:tag]}")
  end

  get '/tag/:tag' do |t|
    @links = Tag.get_links_by_tag(t)
    erb(:link_filter)
  end

  run! if app_file == $0
end
