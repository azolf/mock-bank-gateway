def process_post_authorize(request, response)
  id = SecureRandom.uuid
  amount =  JSON.parse(request.body)['amount']
  callback_url = JSON.parse(request.body)['callback_url']
  insert_transaction(id, amount, callback_url)

  render_json({
    id: id,
    amount: amount,
    callback_url: callback_url,
    status: :ok
  }.to_json, response)
end