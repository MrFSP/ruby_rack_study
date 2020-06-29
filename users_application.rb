require 'json'

class UsersApplication
  include ApplicationHelpers

  def initialize(database)
    @database = database
  end

  def call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers["Content-Type"] = "application/json"

    case request.path_info
    when ""
      get_all_users(request, response)
    when %r{/\d+}
      get_a_user(request, response)
    else
      missing(response)
    end

    response.finish
  end

  def get_all_users(request, response)
    respond_with_object(response, @database.users(request.env["rides_app.user_id"]))
  end

  def get_a_user(request, response)
    id = request.path_info.split("/").last.to_i
    user = @database.users(request.env["rides_app.user_id"])[id]
    if user.nil?
      error(response, "No user with id #{id}", 404)
    else
      respond_with_object(response, user)
    end
  end
end

