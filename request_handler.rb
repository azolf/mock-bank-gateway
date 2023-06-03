# frozen_string_literal: true

# Handle the incoming requests
class RequestHandler < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    method_name = "process_#{request.path.delete_prefix('/')}".to_sym
    send(method_name, request, response)
  rescue NoMethodError
    raise 'Not Found'
  end

  def do_POST(request, response)
    method_name = "process_post_#{request.path.delete_prefix('/')}".to_sym
    send(method_name, request, response)
  rescue NoMethodError
    raise 'Not Found'
  end
end