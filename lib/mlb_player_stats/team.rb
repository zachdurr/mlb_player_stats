class MlbPlayerStats::Team
  @@all = []
  # ["Atlanta Braves", "Arizona Diamondbacks", "Baltimore Orioles"]

  attr_accessor :name, :link

  def initialize(name)
    @name = name
    save
  end

  def self.all
    MlbPlayerStats::Scraper.scrape_teams if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end


end
