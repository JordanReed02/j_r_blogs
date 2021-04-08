require "./config/environment"

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        erb :'/homepage'
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end

        def current_user
           @current_user = User.find_by(session[:user_id])
        end

        def authorized_to_edit?(post)
            @post.user == @current_user
        end

    end


end
