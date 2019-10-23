ENV['RACK_ENV']='development'

require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'

require './models/user'

class MakersBnB < Sinatra::Base

  set :database_file, 'config/database.yml'
  register Sinatra::ActiveRecordExtension

  enable :sessions 

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

  # Delete space

  run! if app_file == $0

end
