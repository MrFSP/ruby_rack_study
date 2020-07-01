class UrlAppender
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    session = env["rack.session"]
    history = (session["history"] || "")
    session["history"] = env["PATH_INFO"] + ", " + history

    puts history

    @app.call(env)
  end
end
