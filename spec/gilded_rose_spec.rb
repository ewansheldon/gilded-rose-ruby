require File.join(File.dirname(__FILE__), '../gilded_rose')
require File.join(File.dirname(__FILE__), '../item')


describe GildedRose do
  let(:item) {Item.new('apple', 5, 20)}
  let(:brie) {Item.new('Aged Brie', 5, 2)}
  let(:sulfuras) {Item.new('Sulfuras, Hand of Ragnaros', 0, 20)}
  let(:pass) {Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)}
  subject(:gilded_rose) {described_class.new([item, brie, sulfuras, pass])}

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

    it 'never makes the quality of an item negative' do
      13.times {gilded_rose.update_quality}
      expect(item.quality).to eq 0
      gilded_rose.update_quality
      expect(item.quality).to eq 0
    end

    it 'increases quality of aged Brie as it gets older' do
      expect(brie.quality).to eq 2
      gilded_rose.update_quality
      expect(brie.quality).to eq 3
    end

    it 'never allows the quality of an item to increase above 50' do
      48.times {gilded_rose.update_quality}
      expect(brie.quality).to eq 50
      gilded_rose.update_quality
      expect(brie.quality).to eq 50
    end

    it 'does not change the quality of Sulfuras' do
      expect(sulfuras.quality).to eq 20
      expect(sulfuras.sell_in).to eq 0
      gilded_rose.update_quality
      expect(sulfuras.quality).to eq 20
      expect(sulfuras.sell_in).to eq 0
    end

    it 'increases backstage pass quality by two within 5-10 days' do
      5.times {gilded_rose.update_quality}
      expect(pass.quality).to eq 20
    end

    it 'increases backstage pass quality by three within 5 days' do
      5.times {gilded_rose.update_quality}
      expect(pass.quality).to eq 20
      gilded_rose.update_quality
      expect(pass.quality).to eq 23
    end

    it 'sets quality of backstage pass at 0 when pass sell_in' do
      11.times {gilded_rose.update_quality}
      expect(pass.quality).to eq 0
    end
  end
end
