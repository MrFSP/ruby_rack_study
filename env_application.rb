class EnvApplication
  def call(env)
    if env['PATH_INFO'] == ''
      request = Rack::Request.new(env)
      [200, {}, [request.env.to_s]]
    else
      [404, {}, ['<h1>Nothing Here!</h1>']]
    end
  end
end
