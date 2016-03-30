class ItemDecorator
  attr_accessor :item
  BRIE = "Aged Brie"
  PASSES = "Backstage passes to a TAFKAL80ETC concert"
  HAND = "Sulfuras, Hand of Ragnaros"

  def initialize(item)
    raise "item quality < 0" if item.quality < 0
    @item = item
  end

  def update
    @item.quality -= 1 if @item.quality > 0
    @item.quality -= 1 if (@item.quality > 0 and @item.sell_in < 1)
    @item.sell_in -= 1
  end

  def self.make(item)
    case item.name
    when self::BRIE
      Brie.new(item)
    when self::PASSES
      Passes.new(item)
    when self::HAND
      Hand.new(item)
    else
      if (item.name =~ /Conjured/)
        Conjured.new(item)
      else
        ItemDecorator.new(item)
      end
    end
  end
end

class Brie < ItemDecorator
  def update
    @item.quality += 1
    @item.quality += 1 if @item.sell_in <= 0
    @item.quality = 50 if @item.quality > 50
    @item.sell_in -= 1
  end
end

class Passes < ItemDecorator
  def update
    amount = 1
    if (@item.sell_in <= 10 and @item.sell_in > 5)
      amount = 2
    elsif (@item.sell_in <= 5)
      amount = 3
    end

    @item.quality += amount
    @item.quality = 50 if @item.quality > 50
    @item.quality = 0 if @item.sell_in <= 0
    @item.sell_in -= 1
  end
end

class Hand < ItemDecorator
  def initialize(item)
    raise "Item quality != 80" if item.quality != 80
    super(item)
  end

  def update
    # It does nothing!
  end
end

class Conjured < ItemDecorator
  def update
    @item.quality -= 2
    @item.quality -= 2 if @item.sell_in <=0
    @item.quality = 0 if @item.quality < 0
    @item.sell_in -= 1
  end

end