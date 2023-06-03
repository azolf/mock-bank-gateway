def process_payment(request, response)
  id = request.query['id']
  @transaction = get_transaction(id)
  puts @transaction
  template = File.read('templates/payment.html.erb')
  result = ERB.new(template).result(binding)
  puts result.inspect

  render_html(result, response)
end