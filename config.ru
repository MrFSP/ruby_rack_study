require_relative 'api_key'
require_relative 'application_helpers'
require_relative 'users_application'
require_relative 'rides_application'
require_relative 'env_application'

require_relative 'database'
database = Database.new

use ApiKey, database: database

use Rack::Runtime
use Rack::ContentType, "application/json"
use Rack::ContentLength

use Rack::ETag
use Rack::ConditionalGet
use Rack::Deflater

map('/users') do
  run UsersApplication.new(database)
end

map('/rides') do
  run UsersApplication.new(database)
end

map('/env') do
  run UsersApplication.new(database)
end
