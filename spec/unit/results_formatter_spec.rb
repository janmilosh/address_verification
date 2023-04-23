require_relative '../../app/lib/results_formatter.rb'
require_relative '../../app/lib/csv_parser.rb'
require_relative '../results_data/test_3_line_results.rb'

describe 'ResultsFormatter' do
  subject { ResultsFormatter.new(csv_data, results) }
  let(:csv_data) { CSVParser.new(file).table }
  let(:file) { "#{ __dir__ }/../../app/data/test_3_line.csv" }
  let(:results) { THREE_LINE_MATCHES }

  describe '#initialize' do
    it 'creates an instance of ResultsFormatter' do
      expect(subject).to be_an_instance_of ResultsFormatter
    end
  end

  describe '#formatted_inputs_results' do
    it 'outputs the formatted inputs and outputs' do
      expect(subject.formatted_inputs_results)
        .to eq ["185 w Winter, delaware, 43015 -> 185 W Winter St, Delaware, 43015-2451",
                "11 bad street, youngstown, 12121 -> Invalid Address",
                "143 e Maine Street, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370"]
    end
  end
end
