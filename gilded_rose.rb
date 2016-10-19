class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each {|item|
    identify(item)}
  end

  private

  def identify(item)
    case item.name
    when "Aged Brie"
      update_brie(item)
    when "Backstage passes to a TAFKAL80ETC concert"
      update_pass(item)
    when "Sulfuras, Hand of Ragnaros"
      
    else
      update_standard(item)
    end
  end

  def update_brie(item)
    item.quality += 1 if item.quality < 50
    decrease_sell_in(item)
  end

  def update_pass(item)
    item.quality += 1 if item.sell_in <= 5
    item.quality += 1 if item.sell_in <= 10
    item.quality += 1
    item.quality = 0 if item.sell_in <= 0
    decrease_sell_in(item)
  end

  def update_standard(item)
    item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
    decrease_sell_in(item)
    reset_to_zero(item)
  end

  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def reset_to_zero(item)
    item.quality = 0 if item.quality < 0
  end

end
