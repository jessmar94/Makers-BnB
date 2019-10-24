require 'bcrypt'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'
require './models/user'
require './models/space'
require './models/request'
require './models/availability'

class MakersBnB < Sinatra::Base


  set :database_file, 'config/database.yml'
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  enable :sessions, :method_override

  # Index Page
  get '/' do
    erb :index
  end

  # Sign up
  post '/users/new' do
    if User.find_by(email: params[:email])
      flash[:notice] = "An account already exists with this email. Please try a different email."
    else
      encrypted_password = BCrypt::Password.create(params[:password])
      user = User.create(
        username: params[:username],
        email: params[:email],
        password: encrypted_password,
      )
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect '/user-options'
    end
    redirect '/'
  end

  get '/user-options' do
    @user = User.find_by(id: session[:user_id])
    #p "Hello " + @user.username
    erb :user_options
  end

  # Log in
  get '/login' do
    erb :login
  end

  post '/users/session' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user[:user_id]
      session[:user_name] = user[:user_name]
      redirect '/user-options'
    else
      flash[:notice] = "Details incorrect. Please check your email or password."
    end
    redirect '/login'
  end

  # Sign Out
  post '/users/:id/session/destroy' do
    session.clear
    flash[:notice] = "You have been signed out."
    redirect '/'
  end

  # View spaces

  post '/spaces' do
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :view_spaces
  end

  get '/spaces/:id' do
    p @space = Space.find(params[:id])
    p @dates = Availability.all
    erb :view_one_space
  end

# Listing a space
  get '/spaces/new' do
    erb :host_spaces
  end

  post '/spaces/new/:id' do
    @space = Space.create(
      name: params[:name],
      description: params[:description],
      ppn: params[:ppn],
      user_id: session[:user_id]

    )
    session[:space_id] = @space.id
    flash[:notice] = "Your listing, #{@space.name}, ID #{@space.id} has been successfully added."
    redirect '/spaces/my-spaces'
  end

  get "/spaces/my-spaces" do
    space = Space.all
    @my_spaces = space.where(user_id: session[:user_id])
    erb :view_my_spaces
  end
  # Delete space

  run! if app_file == $0


end
