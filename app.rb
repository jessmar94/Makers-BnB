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

    @space = Space.find(params[:id])
    @dates = Availability.all
    session[:space_id] = @space.id

    @space = Space.find(params[:id])
    # p Space.all
    @dates = Availability.where(spaces_id: @space.id)
    erb :view_one_space
  end

# Listing a space
  get '/new-spaces' do
    erb :host_spaces
  end

  post '/new-spaces' do
    @new_space = Space.create(
      name: params[:name],
      description: params[:description],
      ppn: params[:ppn],
      user_id: session[:user_id]
    )
    session[:space_id] = @new_space.id
    flash[:notice] = "Your listing, #{@new_space.name}, ID #{@new_space.id} has been successfully added."
    redirect '/my-spaces'
  end

  get "/my-spaces" do
    space = Space.all
    @my_spaces = space.where(user_id: session[:user_id])
    erb :view_my_spaces
  end

  # Requests
  post '/requests/new' do
    my_request = Request.create(
      user_id: session[:user_id],
      space_id: session[:space_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      status: "Pending"
    )
    session[:request_id] = my_request.id
    flash[:notice] = "Your request, ID #{session[:request_id]}, has been created. Please check this page for the status of your request."
    redirect '/requests'
  end

  get '/requests' do
    requests = Request.all
    @requests_made = requests.where(user_id: session[:user_id])
    @space = Space.all
    @requests_received = requests.where(space_id: (@space.where(user_id: session[:user_id])))
    erb :view_my_requests
  end

  post '/requests/:id/accept' do
      this_request = Request.find(params[:id])
      this_request.accept
      redirect '/requests'
  end

  post '/requests/:id/decline' do
    this_request = Request.find(params[:id])
    this_request.decline
    redirect '/requests'
  end


  # Delete space

  run! if app_file == $0


end
