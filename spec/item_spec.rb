require File.join(File.dirname(__FILE__), '../item')

describe Item do

  subject(:item) {described_class.new('apple', 5, 20)}

  describe '#initialize' do
    it 'is instantiated with name, sell_in and quality saved' do
      expect(item.instance_variable_get(:@name)).to eq 'apple'
      expect(item.instance_variable_get(:@sell_in)).to eq 5
      expect(item.instance_variable_get(:@quality)).to eq 20
    end
  end

  describe '#to_s' do
    it 'converts the properties to a string' do
      expect(item.to_s).to eq 'apple, 5, 20'
    end
  end
end
