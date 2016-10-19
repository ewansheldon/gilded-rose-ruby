require File.join(File.dirname(__FILE__), '../gilded_rose')
require File.join(File.dirname(__FILE__), '../item')


describe GildedRose do
  # let(:item) {double :item, name: 'apple', sell_in: 5, quality: 15}

  items = [Item.new('apple', 5, 20)]
  subject(:gilded_rose) {described_class.new(items)}

  describe "#update_quality" do
    it "does not change the name" do
      gilded_rose.update_quality()
      expect(items[0].name).to eq "apple"
    end
  end
end
