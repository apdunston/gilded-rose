require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'
require File.join(File.dirname(__FILE__), 'texttest_fixture')

class TestUntitled < Test::Unit::TestCase

  def setup 
    @fixtures = Fixtures.new
  end

  def update
    @fixtures.gilded_rose.update_quality
  end

  def test_update_quality_doesnt_change_name
    name = "Aged Brie"
    update
    item = @fixtures.gilded_rose.items[1]
    assert_equal item.name, name
  end

  def test_update_quality_cant_set_to_negative
    500.times { update }
    @fixtures.gilded_rose.items.each do |item|
      assert(item.quality >= 0, "Item quality is negative")
    end
  end

  def test_update_quality_after_sell_by
    item = @fixtures.gilded_rose.items[0]
    assert_equal 18, item.quality
    assert_equal 8, item.sell_in
    update
    assert_equal 17, item.quality
    assert_equal 7, item.sell_in
    5.times { update }
    assert_equal 12, item.quality
    assert_equal 2, item.sell_in
    update
    assert_equal 11, item.quality
    assert_equal 1, item.sell_in
    update
    assert_equal 10, item.quality
    assert_equal(-0, item.sell_in)
    update
    assert_equal 8, item.quality
    assert_equal(-1, item.sell_in)
    update
    assert_equal 6, item.quality
    update
    assert_equal 4, item.quality
    update
    assert_equal 2, item.quality
    update
    assert_equal 0, item.quality
    update
    assert_equal 0, item.quality
    update
    assert_equal 0, item.quality
    update
    assert_equal 0, item.quality 
    assert_equal(-8, item.sell_in)
  end

  def test_update_quality_aged_brie
    item = @fixtures.gilded_rose.items[1]
    assert_equal 2, item.quality
    update
    assert_equal 4, item.quality
    5.times { update }
    assert_equal 14, item.quality
    update
    assert_equal 16, item.quality
    update
    assert_equal 18, item.quality
    update
    assert_equal 20, item.quality
    update
    assert_equal 22, item.quality
    update
    assert_equal 24, item.quality
    12.times { update }
    assert_equal 48, item.quality
    update
    assert_equal 50, item.quality
    update
    assert_equal 50, item.quality
    500.times { update }    
    assert_equal 50, item.quality
  end

  def test_update_quality_never_more_than_50_except_sulfuras
    500.times do
      update
      @fixtures.gilded_rose.items.each do |item|
        assert(item.quality <= 50, "violated by #{item.name}") if (item.name != "Sulfuras, Hand of Ragnaros")        
      end
    end
    @fixtures.gilded_rose.items.each do |item|
      assert(item.quality > 50, "violated by #{item.name}") if (item.name == "Sulfuras, Hand of Ragnaros")        
    end
  end

  def test_sulfuras_doesnt_age
    hand = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=1, quality=80)
    g = GildedRose.new([hand])
    500.times {g.update_quality}
    assert_equal 80, hand.quality
    assert_equal 1, hand.sell_in
  end

  def test_sulfuras_cant_not_be_80
    assert_raise do
      GildedRose.new([Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=1000)])
    end
  end

  def test_quality_cant_be_negative
    assert_raise do
      GildedRose.new([Item.new(name="Thing", sell_in=0, quality=-1)])
    end
  end

  def test_update_quality_sulfuras
    500.times do
      update
      assert_equal 80, @fixtures.gilded_rose.items[3].quality
      assert_equal 80, @fixtures.gilded_rose.items[4].quality
    end
  end

  def test_update_quality_passes
    #5,6,7
    items = @fixtures.gilded_rose.items
    pass = items[5]
    # increase by 1
    update
    assert_equal 23, pass.quality
    assert_equal 12, pass.sell_in
    update
    update
    assert_equal 25, pass.quality
    assert_equal 10, pass.sell_in
    # increase by 2
    update
    assert_equal 27, pass.quality
    assert_equal 9, pass.sell_in
    4.times { update }
    assert_equal 35, pass.quality
    assert_equal 5, pass.sell_in
    update
    assert_equal 38, pass.quality
    assert_equal 4, pass.sell_in
    update
    assert_equal 41, pass.quality
    assert_equal 3, pass.sell_in
    update
    assert_equal 44, pass.quality
    assert_equal 2, pass.sell_in
    update
    assert_equal 47, pass.quality
    assert_equal 1, pass.sell_in
    update
    assert_equal 50, pass.quality
    assert_equal 0, pass.sell_in
    update
    assert_equal 0, pass.quality
    assert_equal(-1, pass.sell_in)
    update
    assert_equal 0, pass.quality
    assert_equal(-2, pass.sell_in)
  end

  def test_update_quality_conjured
    item = Item.new(name="Conjured Waffles", sell_in=10, quality=100)
    g = GildedRose.new([item])
    g.update_quality
    assert_equal item.quality, 98
    assert_equal item.sell_in, 9
    g.update_quality
    assert_equal item.quality, 96
    assert_equal item.sell_in, 8
    g.update_quality
    assert_equal item.quality, 94
    assert_equal item.sell_in, 7
    g.update_quality
    assert_equal item.quality, 92
    assert_equal item.sell_in, 6
    g.update_quality
    assert_equal item.quality, 90
    assert_equal item.sell_in, 5
    g.update_quality
    assert_equal item.quality, 88
    assert_equal item.sell_in, 4
    g.update_quality
    assert_equal item.quality, 86
    assert_equal item.sell_in, 3
    g.update_quality
    assert_equal item.quality, 84
    assert_equal item.sell_in, 2
    g.update_quality
    assert_equal item.quality, 82
    assert_equal item.sell_in, 1
    g.update_quality
    assert_equal item.quality, 80
    assert_equal item.sell_in, 0
    g.update_quality
    assert_equal item.quality, 76
    assert_equal item.sell_in, -1
    g.update_quality
    assert_equal item.quality, 72
    assert_equal item.sell_in, -2
    500.times { g.update_quality }
    assert_equal item.quality, 0
    
  end

end