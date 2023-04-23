require_relative '../../app/services/smarty_service.rb'
require_relative '../../app/lib/smarty_helper.rb'
require_relative '../../app/lib/csv_parser.rb'
require_relative '../results_data/test_2_line_results.rb'

describe 'SmartyService' do
  subject { SmartyService.new(batch) }
  let(:batch) { SmartyHelper.new(data) }
  let(:data) { CSVParser.new(:file) }
  let(:file) { "#{ __dir__ }/../../app/data/test_2_line.csv" }

  describe '#initialize' do
    it 'creates a SmartyService instance' do
      expect(subject).to be_an_instance_of(SmartyService)
    end
  end
end
