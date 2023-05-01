require_relative '../../app/lib/cache_reader.rb'
require_relative '../../app/lib/csv_parser.rb'

describe CacheReader do
  subject { CacheReader.new(file, address) }
  let(:file) { "#{ __dir__ }/../test_cache/cache.txt" }
  let(:csv_file) { "#{ __dir__ }/../../app/data/test_3_line.csv" }
  let(:cached_address1) { CSVParser.new(csv_file).table[1] }
  let(:cached_address2) { CSVParser.new(csv_file).table[2] }
  let(:uncached_address) { CSVParser.new(csv_file).table[0] }
  let(:cached_response1) { '11 bad street, youngstown, 12121 -> Invalid' }
  let(:cached_response2) { '143 e Maine Street, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370' }

  before do
    File.open(file,'w') do |f|
      f.puts cached_response1
      f.puts cached_response2
    end
  end

  after do
    File.delete(file)
  end

  describe '#cached_address' do
    context 'address is cached' do
      let(:address) { cached_address1 }
      it 'returns the cached response' do
        expect(subject.cached_address).to eq cached_response1
      end
    end
    
    context 'address is not cached' do
      let(:address) { uncached_address }
      it 'returns false' do
        expect(subject.cached_address).to eq false
      end
    end
  end
end
