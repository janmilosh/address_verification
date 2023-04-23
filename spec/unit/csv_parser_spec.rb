require_relative '../../app/lib/csv_parser.rb'

describe CSVParser do
  subject { CSVParser.new(file) }  
  let(:table) { subject.table }
  let(:file) { "#{ __dir__ }/../../app/data/test_2_line.csv" }

  describe '#initialize' do
    it 'creates a CSV::Table instance' do
      expect(subject.table).to be_an_instance_of CSV::Table
    end
  end

  describe '#table' do
    it 'should have symbol headers' do
      expect(table.headers).to eq [:street, :city, :zip_code]
    end

    it 'should contain two rows' do
      expect(table.size).to eq 2
    end

    it 'should have accessible address elements' do
      expect(table[0][:city]).to eq 'Columbus'
      expect(table[1][:zip_code]).to eq '11111'
    end

    describe 'unclean file with blank and empty lines' do
      let(:file) { "#{ __dir__ }/../../app/data/test_no_data_lines.csv" }

      it 'should skip lines with no data' do
        expect(table.size).to eq 2
      end

      it 'should have accessible address elements' do
        expect(table[1][:city]).to eq 'Title'
        expect(table[0][:zip_code]).to eq '43215'
      end
    end
  end
end
