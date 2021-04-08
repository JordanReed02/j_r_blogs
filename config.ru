require './config/environment'
require 'tux'

use Rack::MethodOverride
run ApplicationController
run PostsController
run SessionsController
run UserController
