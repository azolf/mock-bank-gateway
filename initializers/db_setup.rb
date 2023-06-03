MockBankGateway.configuration.database.execute <<-SQL
  CREATE TABLE IF NOT EXISTS transactions (
    id varchar(30),
    callback_url varchar(1024),
    status varchar(10),
    amount int,
    verified_at datetime
  );
SQL
