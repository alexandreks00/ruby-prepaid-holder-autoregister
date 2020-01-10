require "rspec"
require "httparty"
require "cucumber"
require "mysql2"
require "json"
require "pry"
require "base64"
require "faker"
require "cpf_faker"
require "report_builder"
require "json-schema"
require "async/await"

require_relative "./helpers/utils/create_array/create_array.rb"
require_relative "./helpers/utils/models/model_modalities.rb"

World(CreateArrayObject)
World(ModelModalities)

$schema_root = "features/support/helpers/schemas/"

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# ENV['ENV'] = 'qa' unless ENV.key? 'ENV'
# ENV['ENV'] = 'hml' unless ENV.key? 'ENV'
ENV["ENV"] = "dev" unless ENV.key? "ENV"

ENVIRONMENT = YAML.load_file("./base_uri.yml")[ENV["ENV"]]

puts "Rodando em #{[ENV["ENV"]]}"

class Http
  include HTTParty
  include RSpec::Matchers

  base_uri ENVIRONMENT["api"]
  format :json
end

class Token
  def initialize
    $client_id = "e5f6a08d-4990-3881-81be-adafcb4dc155"
    @authorization = "Basic ZTVmNmEwOGQtNDk5MC0zODgxLTgxYmUtYWRhZmNiNGRjMTU1OmZmY2M3MzI4LTAwNjktM2RhOS1iNzg5LWVhZTQwZjEyODFjOA=="
    @grant_type = "password"

    @userEmissor = {
      :username => "api-pagamentos",
      :password => "apipagamentos",
    }

    @userIntermediario = {
      :username => "cielo_hml",
      :password => "DTvheEaQr3T9",
    }
  end

  def gera_token_emissor
    @response1 = Http.post("/oauth-b2b/v1/oauth/token",
                           :body => @userEmissor,
                           :headers => {
                             "Authorization" => @authorization,
                             "client_id" => $client_id,
                             "grant_type" => @grant_type,
                           })

    "#{@response1.parsed_response["access_token"]}"
  end

  # def gera_token_intermediario
  #     @response2 = Http.post("/oauth-b2b/v1/oauth/token",
  #                         :body => @userIntermediario,
  #                         :headers => {
  #                             'Authorization' => @authorization,
  #                             'client_id' => $client_id,
  #                             'grant_type' => @grant_type
  #                         }
  #                         )

  #     "#{@response2.parsed_response['access_token']}"
  # end
end

$access_token_emissor = Token.new.gera_token_emissor
# $access_token_intermediario = Token.new.gera_token_intermediario

puts "Access Token Emissor #{$access_token_emissor}"
# puts "Access Token Intermediario #{$access_token_intermediario}"
