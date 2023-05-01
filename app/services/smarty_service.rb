require_relative '../../credentials.rb'
require 'smartystreets_ruby_sdk/static_credentials'
require 'smartystreets_ruby_sdk/client_builder'

class SmartyService
  def initialize(lookup)
    @lookup = lookup
  end

  def get_match
    begin
      client.send_lookup(@lookup)
    rescue SmartyStreets::SmartyError => err
      puts err
      return
    end
  end

  private

  def credentials
    SmartyStreets::StaticCredentials.new(AUTH_ID, AUTH_TOKEN)
  end

  def client
    SmartyStreets::ClientBuilder.new(credentials).with_licenses([LICENSE])
                                                 .build_us_street_api_client
  end
end
