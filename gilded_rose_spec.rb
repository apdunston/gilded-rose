require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      name = "foo"
      items = [Item.new(name, 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq(name)
    end

    it "does not change to negative"
  end

end
