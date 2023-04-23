require_relative 'lib/csv_parser.rb'
require_relative 'lib/smarty_helper.rb'
require_relative 'services/smarty_service.rb'
require_relative 'lib/results_formatter.rb'

class Main
  def initialize(file, num_candidates=1)
    @file = file
    @num_candidates = num_candidates
  end

  def run
    data = CSVParser.new(@file).table
    batched_data = SmartyHelper.new(data, @num_candidates).batch
    results = SmartyService.new(batched_data).get_matches
    ResultsFormatter.new(data, results).formatted_inputs_results
  end
end
