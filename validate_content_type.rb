class ValidateContentType
  def initialize(app, opts={})
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    if headers["Content-Type"] == "application/json"
      begin
        content = ""
        body.each do |piece|
          content += piece
        end

        JSON.parse(content)

      rescue JSON::ParserError
        new_body = JSON.generate(error: content)
        response = Rack::Response.new([new_body], status, headers)
        return response.finish
      end
    end

    [status, headers, body]
  end
end

