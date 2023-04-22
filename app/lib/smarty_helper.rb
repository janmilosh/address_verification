require_relative '../../credentials.rb'
require 'smartystreets_ruby_sdk/static_credentials'

class SmartyHelper
  attr_reader :street, :city, :zip

  def initialize(street, city, zip)
    @street = street
    @city = city
    @zip = zip
  end

  def credentials
    SmartyStreets::StaticCredentials.new(AUTH_ID, AUTH_TOKEN)
  end
end
