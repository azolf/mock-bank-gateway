def process_health_check(request, response)
  render_json({status: :ok}.to_json, response)
end