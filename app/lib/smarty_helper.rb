require 'smartystreets_ruby_sdk/batch'
require 'smartystreets_ruby_sdk/us_street/lookup'
require 'smartystreets_ruby_sdk/us_street/match_type'

class SmartyHelper
  def initialize(parsed_data, num_candidates=1)
    @data = parsed_data
    @num_candidates = num_candidates
  end

  def batch
    batched_data = SmartyStreets::Batch.new
    @data.each_with_index do |address, i|
      batched_data.add(SmartyStreets::USStreet::Lookup.new)
      batched_data[i].street = address[:street]
      batched_data[i].city = address[:city]
      batched_data[i].zipcode = address[:zip_code]
      batched_data[i].candidates = @num_candidates
      batched_data[i].match = match
    end
    batched_data
  end

  private

  def match
    SmartyStreets::USStreet::MatchType::STRICT
  end
end
