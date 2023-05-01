require_relative '../../app/lib/smarty_helper.rb'
require_relative '../../app/lib/csv_parser.rb'

describe SmartyHelper do
  let(:file) { "#{ __dir__ }/../../app/data/test_2_line.csv" }
  let(:address) { CSVParser.new(file).table.first }
  subject { SmartyHelper.new(address) }

  describe '#initialize' do
    it 'creates a SmartyHelper instance' do
      expect(subject).to be_an_instance_of(SmartyHelper)
    end
  end

  describe '#lookup' do
    let(:lookup) { subject.lookup }
    it 'creates a SmartyStreets::Lookup instance' do
      expect(lookup).to be_an_instance_of(SmartyStreets::USStreet::Lookup)
    end

    it 'contains the correct data' do
      expect(lookup.street).to eq '143 e Maine Street'
      expect(lookup.city).to eq 'Columbus'
      expect(lookup.zipcode).to eq '43215'
    end
  end
end
