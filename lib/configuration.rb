# frozen_string_literal: true

module MockBankGateway
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :cookie_name
    attr_accessor :webserver_port
    attr_accessor :database

    def cookie_name
      @authorize_address || 'mock_bank_gateway'
    end

    def database
      @database || SQLite3::Database.new('mbg.db')
    end

    def webserver_port
      @webserver_port || '8000'
    end
  end
end