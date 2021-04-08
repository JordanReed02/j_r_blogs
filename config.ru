require_relative './config/environment'


use Rack::MethodOverride
run ApplicationController
run PostsController
run SessionsController
run UsersController
