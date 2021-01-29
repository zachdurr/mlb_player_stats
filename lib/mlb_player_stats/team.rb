class MlbPlayerStats::Team
  @@all = []

  attr_accessor :name, :url, :players
  attr_writer :players

  def initialize(name, url=nil)
    @name = name
    @players = []
    save
  end

  def self.all
    MlbPlayerStats::Scraper.new.team_names if @@all.empty?
    @@all
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def players
    MlbPlayerStats::Player.all << @players unless MlbPlayerStats::Player.all.include?(@players)
    @players
  end

  def add_players(player_arr, url_arr)
    index = 0
    player_arr.each do |player|
      index += 1
      new_player = MlbPlayerStats::Player.new(player, self)
      @players << new_player unless @players.include?(new_player)
      if new_player.team == nil
        new_player.team = self
      elsif new_player.name == nil
        new_player.name = player
      elsif new_player.url == nil
        new_player.url = url_arr[index]
      end
    end
  end

  # def add_players_url(url_arr)
  #   MlbPlayerStats::Player.all.each do |player|
  #     index =+ 0
  #     player.url = url_arr[index] unless player.url =! nil
  #   end
  # end



end
