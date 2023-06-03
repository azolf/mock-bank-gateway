def insert_transaction(id, amount, callback_url)
  MockBankGateway.configuration.database.execute "
  INSERT INTO transactions(id, amount, callback_url)
  VALUES (?, ?, ?)", id, amount, callback_url
end

def get_transaction(id)
  query = "SELECT * FROM transactions WHERE id = '#{id}'"
  result = MockBankGateway.configuration.database.execute(query).first
  columns = [:id, :callback_url, :status, :amount, :verified_at]

  Hash[columns.zip(result.to_a)]
end

def update_transaction_status(id, status)
  query = "UPDATE transactions SET status = '#{status}' WHERE id = '#{id}'"
  puts query
  MockBankGateway.configuration.database.execute query
end

def update_transaction_verified(id)
  query = "UPDATE transactions set verified_at = '#{DateTime.now}' WHERE id = '#{id}'"
  MockBankGateway.configuration.database.execute query
end