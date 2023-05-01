require_relative '../../app/lib/cache_writer.rb'

describe CacheWriter do
  subject { CacheWriter.new(file, address_to_add) }
  let(:file) { "#{ __dir__ }/../test_cache/cache.txt" }
  let(:address_to_add) { '11 bad street, youngstown, 12121 -> Invalid' }
  let(:cached_response1) { '1 Empora St, Title, 11111 -> Invalid' }
  let(:cached_response2) { '143 e Maine Street, Columbus, 43215 -> 143 E Main St, Columbus, 43215-5370' }
  let(:result) { "#{cached_response1}\n#{cached_response2}\n#{address_to_add}\n" }

  before do
    File.open(file,'w') do |f|
      f.puts cached_response1
      f.puts cached_response2
    end
  end

  after do
    File.delete(file)
  end

  describe '#add_to_cache' do
    it 'returns the cached response' do
      subject.add_to_cache
      expect(File.read(file)).to eq result
    end
  end
end
