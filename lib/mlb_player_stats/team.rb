class MlbPlayerStats::Team
  @@all = []
  # ["Atlanta Braves", "Arizona Diamondbacks", "Baltimore Orioles"]

  attr_accessor :name

  def initialize(name)
    @name = name
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end


end
