class ApiKey
  def initialize(app, opts={})
    @app = app
    @database = opts[:database]
  end

  def call(env)
    api_key = env['HTTP_API_KEY']
    user = @database.user_by_api_key(env["HTTP_API_KEY"])

    if user.nil?
      [403, {}, ["Forbidden"]]
    else
      env["rides_app.user_id"] = user[:id]
      @app.call(env)
    end
  end
end
