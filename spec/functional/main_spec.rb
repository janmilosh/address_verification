require_relative '../../app/main.rb'
require_relative '../test_data/test_3_line_results.rb'

describe 'Main' do
  subject { Main.new(full_path_to_csv_file) }
  let(:full_path_to_csv_file) { "#{ __dir__ }/../test_data/test_3_line.csv" }

  describe '#run' do
    it 'returns an array of matches' do
      expect(subject.run).to eq THREE_LINE_MATCHES
    end
  end
end
