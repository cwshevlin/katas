
def update_quality(items)
  items.each do |item|
    if item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert' || item.name == 'Sulfuras, Hand of Ragnaros'
      update_special_item(item)
    else
      update_regular_item(item)
    end
  end
end

def update_special_item(item)
  
end

def update_regular_item(item)
  item.quality -= 1
  item.sell_in -= 1
end


# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

