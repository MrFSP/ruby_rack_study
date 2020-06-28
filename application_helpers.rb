module ApplicationHelpers
  def respond_with_object(response, object)
    response.write(JSON.generate(object))
  end

  def error(response, message, status = 400)
    response.status = status
    response.write("ERROR: #{message}")
  end

  def missing(response)
    response.status = 404
    response.write("Nothing Here!")
  end
end
