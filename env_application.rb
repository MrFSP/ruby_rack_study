class EnvApplication

  def initialize(database)
    @database = database
  end

  def call(env)
    if env['PATH_INFO'] == ''
      request = Rack::Request.new(env)
      env_print = request.env.reduce('') { |acc, item| "#{acc}\n#{item.to_s}" }
      [200, {}, [env_print]]
    else
      [404, {}, ['<h1>Nothing Here!</h1>']]
    end
  end
end
