require_relative '../../app/lib/results_formatter.rb'
require_relative '../../app/lib/csv_parser.rb'
require_relative '../results_data/multiple_candidates_results.rb'

describe 'ResultsFormatter' do
  subject { ResultsFormatter.new(csv_data, results) }
  let(:csv_data) { CSVParser.new(file).table }
  let(:file) { "#{ __dir__ }/../../app/data/multiple_candidates.csv" }
  let(:results) { MULTIPLE_CANDIDATES_MATCHES }

  describe '#initialize' do
    it 'creates an instance of ResultsFormatter' do
      expect(subject).to be_an_instance_of ResultsFormatter
    end
  end

  describe '#formatted_inputs_results' do
    it 'outputs the formatted inputs and outputs' do
      expect(subject.formatted_inputs_results)
        .to eq ["1 Rosedale, Baltimore, 21229 -> 1 N Rosedale St, Baltimore, 21229-3737",
                "                             -> 1 S Rosedale St, Baltimore, 21229-3739",
                "11 bad street, youngstown, 12121 -> Invalid Address",
                "143 e Maine Street, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370"]
    end
  end
end
