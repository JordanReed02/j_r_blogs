require "sinatra"
require "sinatra/activerecord"



require_relative "models/post"


after do
  ActiveRecord::Base.connection.close
end
