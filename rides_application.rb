require 'json'

class RidesApplication
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers['Content-Type'] = 'application/json'

    if env['PATH_INFO'] == ''
      if request.post?
        begin
          ride = JSON.parse(request.body.read)
          Database.add_ride(ride)
          response.write(JSON.generate({ message: 'Ride received' }))
        rescue JSON::ParserError
          response.status = 400
          response.write('Invalid JSON')
        end
      else
        response.write(JSON.generate(Database.rides))
      end
    elsif env['PATH_INFO'] =~ %r{/\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      response.write(JSON.generate(Database.rides[id]))
    else
      response.status = 404
      response.write('Nothing Here')
    end

    response.finish
  end
end
