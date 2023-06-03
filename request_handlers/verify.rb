def process_post_verify(request, response)
  id = JSON.parse(request.body)['id']
  transaction = get_transaction(id)
  if(transaction[:status] == 'confirmed' && transaction[:verified_at] == nil)
    update_transaction_verified(id)
  end

  render_json(get_transaction(id).to_json, response)
end