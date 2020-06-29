class api_key
  def initialize(app, opts = {})
    @app = app
  end

  def call(env)
    @app.call(env)
  end
end
