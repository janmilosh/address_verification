require_relative '../../app/lib/csv_parser.rb'

describe CSVParser do
  subject     { CSVParser.new(file) }  
  let(:table) { subject.table }
  
  describe '#initialize' do
    let(:file) { "#{ __dir__ }/../../app/data/test_2_line.csv" }
    
    it 'should create a CSV::Table object' do
      expect(subject.table.class).to eq CSV::Table
    end

    it 'should convert headers to symbols' do
      expect(table.headers).to eq [:street, :city, :zip_code]
    end

    it 'should contain two rows' do
      expect(table.size).to eq 2
    end

    it 'should have accessible address elements' do
      expect(table[0][:city]).to eq 'Columbus'
      expect(table[1][:zip_code]).to eq '11111'
    end
  end

  context 'unclean file with blank and empty lines' do
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
