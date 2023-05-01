require 'smartystreets_ruby_sdk/us_street/lookup'
require 'smartystreets_ruby_sdk/us_street/match_type'

class SmartyHelper
  def initialize(address)
    @address = address
  end

  def lookup
    l = SmartyStreets::USStreet::Lookup.new
    l.street = @address[:street]
    l.city = @address[:city]
    l.zipcode = @address[:zip_code]
    l.match = match
    l
  end

  private

  def match
    SmartyStreets::USStreet::MatchType::STRICT
  end
end
