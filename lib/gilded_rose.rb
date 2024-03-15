class GildedRose
  attr_reader :name, :item

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @item = get_type(name).new(quality, days_remaining) #(name, days_remaining, quality)
  end

  def get_type(name)
    types = {
      'Normal Item' => Normal,
      'Aged Brie' => Brie,
      'Sulfuras, Hand of Ragnaros' => Sulfuras,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
    }
    return types[@name]
  end

  def tick
    @item.tick
  end

  def quality
    return item.quality if item
  end

  def days_remaining
    return item.days_remaining if item
  end

  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 and @quality < 50
    end
  end

  class Sulfuras
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick

    end
  end


  def sulfuras_tick
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining < 5
      @quality += 1 if @days_remaining < 10

      @quality = 0 if @days_remaining < 0
    end
  end

end
