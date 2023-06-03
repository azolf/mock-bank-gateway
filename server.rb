# frozen_string_literal: true

require 'webrick'
require 'securerandom'
require 'json'
require 'base64'
require 'sqlite3'

require_relative 'request_handler'
require_relative 'helpers/response'
require_relative 'helpers/database'
require_relative 'request_handlers/authorize'
require_relative 'request_handlers/payment'
require_relative 'request_handlers/finish'
require_relative 'request_handlers/verify'
require_relative 'lib/configuration'
require_relative 'initializers/mock_bank_gateway'
require_relative 'initializers/db_setup'


server = WEBrick::HTTPServer.new Port: MockBankGateway.configuration.webserver_port
server.mount '/', RequestHandler
trap('INT') { server.shutdown }

server.start