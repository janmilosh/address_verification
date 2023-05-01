require_relative 'lib/csv_parser.rb'
require_relative 'lib/smarty_helper.rb'
require_relative 'services/smarty_service.rb'
require_relative 'lib/results_formatter.rb'
require_relative 'lib/cache_reader.rb'
require_relative 'lib/cache_writer.rb'

class Main
  def initialize(csv_file)
    @csv_file = csv_file
    @cache_file = "./address_cache/cache.txt"
  end

  def run
    data = CSVParser.new(@csv_file).table
    data.each do |address|
      cached_address = CacheReader.new(@cache_file, address).cached_address
      if cached_address
        puts cached_address
      else
        lookup = SmartyHelper.new(address).lookup
        result = SmartyService.new(lookup).get_match
        address_response = ResultsFormatter.new(address, result).formatted_address
        CacheWriter.new(@cache_file, address_response).add_to_cache
        puts address_response
      end
    end
  end
end
