require_relative '../../app/lib/smarty_helper.rb'
require_relative '../../app/lib/csv_parser.rb'

describe SmartyHelper do
  let(:file) { "#{ __dir__ }/../../app/data/test_2_line.csv" }
  let(:data) { CSVParser.new(file).table }
  let(:num_candidates) { 5 }
  subject { SmartyHelper.new(data, num_candidates) }

  describe '#initialize' do
    it 'creates a SmartyHelper instance' do
      expect(subject).to be_an_instance_of(SmartyHelper)
    end
  end

  describe '#batch' do
    let(:batch) { subject.batch }
    it 'creates a SmartyStreets::Batch instance' do
      expect(batch).to be_an_instance_of(SmartyStreets::Batch)
    end

    it 'contains two elements' do
      expect(batch.size).to eq 2
    end

    it 'contains the correct data' do
      expect(batch[0].city).to eq 'Columbus'
      expect(batch[1].zipcode).to eq '11111'
    end
  end
end
