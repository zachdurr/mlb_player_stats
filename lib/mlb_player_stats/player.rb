class MlbPlayerStats::Player
  @@all = []

  attr_accessor :name, :link, :team

  def initialize(name)
    @name = name
    save
  end

  def self.all
    MlbPlayerStats::Scraper.new.team_page if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end


end
