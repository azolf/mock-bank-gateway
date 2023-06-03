def process_post_finish(request, response)
  status = request.query['status']
  id = request.query['id']
  update_transaction_status(id, status)
  transaction = get_transaction(id)
  params = {status: status, id: id}

  redirect_to(transaction[:callback_url], params, response)
end