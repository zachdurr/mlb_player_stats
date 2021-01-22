class MlbPlayerStats::Team
  @@all = []
  # ["Atlanta Braves", "Arizona Diamondbacks", "Baltimore Orioles"]

  attr_accessor :name, :link, :players
  attr_writer :players

  def initialize(name)
    @name = name
    @players = []
    save
  end

  def self.all
    MlbPlayerStats::Scraper.new.team_names if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end

  def players
    MlbPlayerStats::Player.all << @players unless @players.include?(self)
    @players
  end


end
