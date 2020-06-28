require_relative 'users_application'
require_relative 'rides_application'
require_relative 'env_application'
require_relative 'database'

map('/users') do
  run UsersApplication.new
end

map('/rides') do
  run RidesApplication.new
end

map('/env') do
  run EnvApplication.new
end
