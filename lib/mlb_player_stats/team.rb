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

  # def add_players(arr)
  #   arr.each do |player|
  #     @players << player unless @players.include?(player)
  #     if player.team == nil
  #       player.team = self
  #     elsif player.name == nil
  #       player.name = player
  #     end
  #     MlbPlayerStats::Player.new(name, team)
  #   end
  # end

  def players
    MlbPlayerStats::Player.all << @players unless @players.include?(self)
    @players
  end


end
