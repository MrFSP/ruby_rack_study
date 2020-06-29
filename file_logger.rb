require "logger"

class FileLogger
  def initialize(app, opts = {})
    @app = app
  end

  def call(env)
    logger = ::Logger.new("app.log")
    logger.level = ::Logger::INFO
    env["rack.logger"] = logger

    @app.call(env)
  end
end
