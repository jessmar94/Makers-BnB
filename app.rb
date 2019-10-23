ENV['RACK_ENV']='development'

require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'

require './models/user'
require './models/space'
require './models/request'

class MakersBnB < Sinatra::Base

  set :database_file, 'config/database.yml'
  register Sinatra::ActiveRecordExtension

  enable :sessions, :method_override 

  # Index Page
  get '/' do
    erb :index
  end

  # Sign up
  post '/users/new' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      password: params[:password],
    )

    session[:user_id] = user.id
    # session[:username] = username.username
    redirect '/user-options'
  end

  get '/user-options' do
    erb :user_options
  end

  # Log in

  # Sign Out

  # View spaces
  get '/view-spaces' do
    erb :view_spaces
  end

  get '/host-space' do
    erb :host_spaces
  end

  post '/host_spaces' do
    space = Space.create(
      name: params[:name],
      description: params[:description],
      ppnd: params[:ppn],
    )
    redirect '/user-options'
  end

  # Delete space

  run! if app_file == $0

end
