class UserController < ApplicationController

  get "/" do
     erb :index
   end

   get "/signup" do
     erb :signup
   end

   post "/signup" do
     user = User.new(email: params[:email], password_digest: params[:password])
     if user.save
       redirect '/homepage'
     else
       redirect '/failure'
     end
   end


   get "/login" do
     erb :login
   end

   post "/login" do
     user = User.find_by(email: params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect '/homepage'
     else
       redirect '/failure'
     end
   end

   get "/homepage" do
     if logged_in?
       erb :success
     else
       redirect "/login"
     end
   end

   get "/failure" do
     erb :failure
   end

   get "/logout" do
     session.clear
     redirect "/"
   end

   helpers do
     def logged_in?
       !!session[:user_id]
     end

     def current_user
       User.find(session[:user_id])
     end
   end

 end
