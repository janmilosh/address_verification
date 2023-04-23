require_relative 'lib/csv_parser.rb'
require_relative 'lib/smarty_helper.rb'
require_relative 'services/smarty_service.rb'

class Main
  attr_reader :full_path_to_csv_file, :num_candidates

  def initialize(full_path_to_csv_file, num_candidates=1)
    @file = full_path_to_csv_file
    @num_candidates = num_candidates
  end

  def run
    data = CSVParser.new(@file).table
    batched_data = SmartyHelper.new(data, @num_candidates).batch
    results = SmartyService.new(batched_data).get_matches
    #TODO formatted results
  end
end
