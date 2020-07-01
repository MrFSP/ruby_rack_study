require_relative 'api_key'
require_relative 'file_logger'
require_relative 'friendly_errors'
require_relative 'validate_content_type'
require_relative 'who_is_calling'

require_relative 'application_helpers'
require_relative 'users_application'
require_relative 'rides_application'
require_relative 'env_application'

require_relative 'database'
database = Database.new

use Rack::Runtime
use Rack::ContentType, 'application/json'
use Rack::ContentLength

use Rack::ETag
use Rack::ConditionalGet
use Rack::Deflater

if ENV['RACK_ENV'] == 'production'
  use Rack::NullLogger
  use Rack::CommonLogger
  use FileLogger
else
  use Rack::Logger
  use Rack::Reloader
end

use ApiKey, database: database
use ValidateContentType
use Rack::ShowStatus
use FriendlyErrors

use WhoIsCalling

use Rack::Sendfile
use Rack::Static, urls: ['/docs']

map('/docs') do
  run Rack::File.new('./docs')
end

map('/users') do
  run UsersApplication.new(database)
end

map('/rides') do
  run RidesApplication.new(database)
end

map('/env') do
  run EnvApplication.new(database)
end
