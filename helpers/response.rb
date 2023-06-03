# frozen_string_literal: true

def render_html(body, response)
  response.status = 200
  response['Content-Type'] = 'text/html'
  response.body = body
end

def render_json(body, response)
  response.status = 200
  response['Content-Type'] = 'application/json'
  response.body = body
end

def redirect_to(url, params = {}, response)
  uri = URI(url)
  params.merge!(URI.decode_www_form(uri.query.to_s).to_h)
  uri.query = URI.encode_www_form(params)

  response.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect, uri.to_s)
end