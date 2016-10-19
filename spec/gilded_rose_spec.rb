require File.join(File.dirname(__FILE__), '../gilded_rose')
require File.join(File.dirname(__FILE__), '../item')


describe GildedRose do
  # let(:item) {double :item, name: 'apple', sell_in: 5, quality: 15}

  let(:item) {Item.new('apple', 5, 20)}
  subject(:gilded_rose) {described_class.new([item])}

  describe "#update_quality" do
    it "does not change the name" do
      gilded_rose.update_quality
      expect(item.name).to eq "apple"
    end

    it 'degrades quality twice as quickly after sell by date has passed' do
      5.times {gilded_rose.update_quality}
      expect(item.quality).to eq 15
      gilded_rose.update_quality
      expect(item.quality).to eq 13
    end
  end
end
