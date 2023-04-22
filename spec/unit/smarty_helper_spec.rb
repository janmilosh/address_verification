require_relative '../../app/lib/smarty_helper.rb'

describe SmartyHelper do
  subject { SmartyHelper.new(street, city, zip) }
  let(:street) { '143 e Maine Street' }
  let(:city)   { 'Columbus' }
  let(:zip)    { '43215' }

  describe '#initialize' do
    it 'creates credentials' do
      expect(subject.credentials).to be_an_instance_of(SmartyStreets::StaticCredentials)
    end
  end
end
