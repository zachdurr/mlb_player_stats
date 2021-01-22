class MlbPlayerStats::Team
  @@all = []
  # ["Atlanta Braves", "Arizona Diamondbacks", "Baltimore Orioles"]

  attr_accessor :name, :link, :player

  def initialize(name)
    @name = name
    save
  end

  def self.all
    MlbPlayerStats::Scraper.new.team_names if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end


end
